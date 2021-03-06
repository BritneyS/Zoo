//
//  AnimalListTableViewController.swift
//  Zoo
//
//  Created by Britney Smith on 9/13/18.
//  Copyright © 2018 Britney Smith. All rights reserved.
//

import UIKit

protocol AnimalListTableViewControllerDelegate: class {
    func animalListTableViewControllerUpdate(_ controller: AnimalListTableViewController, didUpdate item: Pen)
}

class AnimalListTableViewController: UITableViewController {

    // MARK: Properties
    
    var penData: Pen?
    var animalList: [Animal] = []
    //var babyAnimalList: [BabyAnimal] = []
    var selectedAnimalIndex = 0
    var delegate: AnimalListTableViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populateAnimals()
//        let updatedBackBarButtonItem = UIBarButtonItem(title: "Back2", style: .plain, target: self, action: #selector(updatePenAnimalIds))
//        self.navigationItem.backBarButtonItem = updatedBackBarButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Methods
   
    func populateAnimals() {
        let animals = AnimalList()
        let penID = penData?.name // [Lion Pen, Monkey Pen, ...]
        print("PenIDs: \(penData!.name) with animals \(penData!.animalID)")
        for animal in animals.animals {
            if animal.key == penID {
                for animalListing in animal.value.animalArray {
                    let newAnimal = animalListing
                    animalList.append(newAnimal)
                }
                for babyAnimalListing in animal.value.babyAnimalArray {
                    let newBabyAnimal = babyAnimalListing
                    animalList.append(newBabyAnimal)
                }
            }
        }
        for animal in animalList {
            print("New animal list: \(animal.name)")
        }
    }

    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return animalList.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Identity.animalCell.rawValue, for: indexPath)
 //       populateAnimals()
        // Configure the cell...
        cell.textLabel?.text = animalList[indexPath.row].name
        return cell
    }
    
    // MARK: Swipe To Delete
    
    private func swipeToDelete(indexPath: IndexPath) {
        animalList.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .fade)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            swipeToDelete(indexPath: indexPath)
        }
    }
 
    // MARK: Segue

    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        selectedAnimalIndex = indexPath.row
        return indexPath
    }
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case Identity.animalToDetailSegue.rawValue:
            print("Animal to Detail Segue")
            guard let animalDetailViewController = segue.destination as? AnimalDetailViewController else { return }
            let selectedAnimal = animalList[selectedAnimalIndex]
            if selectedAnimal is BabyAnimal {
                guard let babySelectedAnimal = selectedAnimal as? BabyAnimal else { return }
                animalDetailViewController.babyAnimalData = babySelectedAnimal
            } else {
                animalDetailViewController.animalData = selectedAnimal
            }
            animalDetailViewController.delegate = self
        case Identity.animalToAddAnimalSegue.rawValue:
            guard let addAnimalViewController = segue.destination as? AddAnimalViewController else { return }
            addAnimalViewController.delegate = self
            
        default:
            print("Error at Animal to Detail segue")
        }
    }
    
    // MARK: BarButton actions
    //@objc
    @IBAction func updatePenAnimalIds() {
        guard let penData = penData else { return }
        print("Update pen animal Ids: \(penData.animalID)")
        populateAnimals()
        delegate?.animalListTableViewControllerUpdate(self, didUpdate: penData)
    }
    
}

// MARK: AddAnimalViewControllerDelegate Protocol Implementation

extension AnimalListTableViewController: AddAnimalViewControllerDelegate {
    
    func addAnimalViewControllerDidCancel(_ controller: AddAnimalViewController) {
        navigationController?.popViewController(animated: true)
    }
    
    func addAnimalViewControllerAdd(_ controller: AddAnimalViewController, didFinishAdding item: Animal) {
        
        let newRowIndex = animalList.count
        animalList.append(item)
        penData?.animalID.append(item.name) // adds reference to new animal record in Pen
        
        
        let indexPath = IndexPath(row: newRowIndex, section: 0)
        tableView.insertRows(at: [indexPath], with: .automatic)
//        saveContact() // data persistence function here
        navigationController?.popViewController(animated: true)
    }
}

// MARK: AnimalListViewControllerDelegate Protocol Implementation

extension AnimalListTableViewController: AnimalDetailViewControllerDelegate {
    
    func animalDetailViewControllerGoBack(_ controller: AnimalDetailViewController) {
        navigationController?.popViewController(animated: true)
    }
    
    func animalDetailViewControllerEdit(_ controller: AnimalDetailViewController, didFinishEditing item: Animal) {
        
        guard let index = animalList.index(of: item) else { return }
        let indexPath = IndexPath(row: index, section: 0)
        
        guard let cell = tableView.cellForRow(at: indexPath) else { return }
        cell.textLabel?.text = item.name
//        saveContact() // data persistence function here
        navigationController?.popViewController(animated: true)
    }
    
}
