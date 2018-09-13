//
//  PenListTableViewController.swift
//  Zoo
//
//  Created by Britney Smith on 9/12/18.
//  Copyright © 2018 Britney Smith. All rights reserved.
//

import UIKit

class PenListTableViewController: UITableViewController {
    
    // MARK: Properties
    
    var habitatData: Habitat?
    var penList: [Pen] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        populatePens()
        guard let habitatData = self.habitatData else {
            print ("No data")
            return
        }
        print("Habitat Data: \(self.habitatData)")

    }

    // MARK: Methods
    
    func populatePens() {
        let pens = PenList()
        //guard let self.habitatData?.penID = penID else { return }
        for penName in (self.habitatData?.penID)! {
            for pen in pens.pens {
                if pen.key == penName {
                    let newPen = Pen(name: pen.key, animals: pen.value)
                    penList.append(newPen)
                }
            }
        }
        print(self.penList)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return penList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Identity.penCell.rawValue, for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = penList[indexPath.row].name
        return cell
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
