//
//  AddAnimalViewController.swift
//  Zoo
//
//  Created by Britney Smith on 9/15/18.
//  Copyright © 2018 Britney Smith. All rights reserved.
//

import UIKit

class AddAnimalViewController: UIViewController {
    
    // MARK: Outlets
    
    @IBOutlet weak var addAnimalNameTextField: UITextField!
    
    @IBOutlet weak var addAnimalSpeciesTextField: UITextField!
    
    @IBOutlet weak var addAnimalGenderTextField: UITextField!
    
    @IBOutlet weak var isBabyAnimalTextField: UITextField!
    
    @IBOutlet weak var addAnimalAgeTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
