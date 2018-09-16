//
//  AddAnimalViewController.swift
//  Zoo
//
//  Created by Britney Smith on 9/15/18.
//  Copyright © 2018 Britney Smith. All rights reserved.
//

import UIKit

protocol AddAnimalViewControllerDelegate: class {
    func addAnimalViewControllerDidCancel(_ controller: AddAnimalViewController)
    func addAnimalViewControllerAdd(_ controller: AddAnimalViewController, didFinishAdding item: Animal)
}

class AddAnimalViewController: UIViewController {
    
    // MARK: Outlets
    
    @IBOutlet weak var currentPenLabel: UILabel!
    
    @IBOutlet weak var addAnimalNameTextField: UITextField!
    
    @IBOutlet weak var addAnimalSpeciesTextField: UITextField!
    
    @IBOutlet weak var addAnimalGenderTextField: UITextField!
    
    @IBOutlet weak var isBabyAnimalTextField: UITextField!
    
    @IBOutlet weak var addAnimalAgeTextField: UITextField!
    
    // MARK: Properties
    
    var delegate: AddAnimalViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: IBActions
    
    @IBAction func save() {
        guard let newSpecies = addAnimalSpeciesTextField.text,
            let newGender = addAnimalGenderTextField.text,
            let newName = addAnimalNameTextField.text else { return }
        let newAnimal = Animal(species: newSpecies, gender: newGender, name: newName)
        
        delegate?.addAnimalViewControllerAdd(self, didFinishAdding: newAnimal)
    }
    
    @IBAction func cancel() {
        delegate?.addAnimalViewControllerDidCancel(self)
    }
    

}
