//
//  AnimalListTableViewController.swift
//  Zoo
//
//  Created by Britney Smith on 9/13/18.
//  Copyright © 2018 Britney Smith. All rights reserved.
//

import UIKit

class AnimalListTableViewController: UITableViewController {

    // MARK: Properties
    
    var penData: Pen?
    var animalList: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populateAnimals()
        guard let penData = self.penData else { return }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Methods
    // componentArray = [String] (dict.keys)
    func populateAnimals() {
        let animals = AnimalList()
        let penID = penData?.name // [Lion Pen, Monkey Pen, ...]
        print("PenIDs: \(penID)")
        for animal in animals.animals {
            if animal.key == penID {
                for animalListing in animal.value {
                    let newAnimal = animalListing.name
                    animalList.append(newAnimal)
                }
            }
        }
        
        print(self.animalList)
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

        // Configure the cell...
        cell.textLabel?.text = animalList[indexPath.row]
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
 

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
