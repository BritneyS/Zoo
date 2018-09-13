//
//  HabitatListTableViewController.swift
//  Zoo
//
//  Created by Britney Smith on 9/12/18.
//  Copyright © 2018 Britney Smith. All rights reserved.
//

import UIKit

class HabitatListTableViewController: UITableViewController {

    // MARK: Properties
    var habitatList: [Habitat] = []
    var selectedHabitatIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populateHabitatList()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Methods
    
    func populateHabitatList() {
        let habitats = HabitatList()
        
        for habitat in habitats.habitats {
            let newHabitat = Habitat(name: habitat.key, penID: habitat.value)
            habitatList.append(newHabitat)
        }
        print("Habitat List and Pens: \(self.habitatList)")
    }
    

    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.habitatList.count
    }
 
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Identity.habitatCell.rawValue, for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = habitatList[indexPath.row].name
        return cell
    }

    
    
    // MARK: Segue
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        selectedHabitatIndex = indexPath.row
        return indexPath
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case Identity.habitatToPenSegue.rawValue:
            print("Habitat to Pen segue")
            guard let penListTableViewController = segue.destination as? PenListTableViewController else { return }
            penListTableViewController.habitatData = habitatList[selectedHabitatIndex]
        default:
            print("Segue is wrong")
        }
        
    }
    

}
