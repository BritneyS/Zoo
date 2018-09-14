//
//  AnimalDetailViewController.swift
//  Zoo
//
//  Created by Britney Smith on 9/13/18.
//  Copyright © 2018 Britney Smith. All rights reserved.
//

import UIKit

class DetailTextField: UITextField {
    
    
    
}



class AnimalDetailViewController: UIViewController {
    
    // MARK: Outlets
    
    @IBOutlet weak var animalNameLabel: UILabel!
    
    @IBOutlet weak var animalSpeciesLabel: UILabel!
    
    @IBOutlet weak var animalGenderLabel: UILabel!
    
    @IBOutlet weak var animalAgeLabel: UILabel!
    
    @IBOutlet weak var animalNameTextField: DetailTextField!
    
    @IBOutlet weak var animalSpeciesTextField: DetailTextField!
    
    @IBOutlet weak var animalGenderTextField: DetailTextField!
    
    @IBOutlet weak var animalAgeTextField: DetailTextField!
    
  //  @IBOutlet weak var editOrSaveBarButtonItem: UIBarButtonItem!
    
    
    
    
    // MARK: Properties
    
    var animalData: Animal?
    var isEditMode = false // where if in editing mode, bar button is 'Save', else 'Edit'
    

    override func viewDidLoad() {
        super.viewDidLoad()
        hideAllTextFields()
        setAnimalLabels()
        toggleEditOrSaveMode() // test
        
        
        
        //guard let animalData = self.animalData as? BabyAnimal else { return }
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: Methods
    
    func setAnimalLabels() {
        animalNameLabel.text = animalData?.name
        animalSpeciesLabel.text = animalData?.species
        animalGenderLabel.text = animalData?.gender
        if animalData is BabyAnimal? {
            setBabyAnimalLabels()
        } else {
            toggleBabyAnimalLabels()
        }
    }
    
    func hideAllTextFields() {
        animalNameTextField.isHidden = true
        animalSpeciesTextField.isHidden = true
        animalGenderTextField.isHidden = true
        animalAgeTextField.isHidden = true
    }
    
    func setBabyAnimalLabels() {
        guard let babyAnimal = (animalData as? BabyAnimal) else { return }
        animalAgeLabel.text = babyAnimal.age
    }
    
    func toggleBabyAnimalLabels() {
        animalAgeLabel.isHidden = !animalAgeLabel.isHidden
    }
    
    func toggleAnimalLabels() {
        animalNameLabel.isHidden = !animalNameLabel.isHidden
        animalSpeciesLabel.isHidden = !animalSpeciesLabel.isHidden
        animalGenderLabel.isHidden = !animalGenderLabel.isHidden
        
    }
    
    func toggleBabyAnimalTextFields() {
        animalAgeTextField.isHidden = !animalAgeTextField.isHidden
    }
    
    func toggleAnimalTextFields() {
        animalNameTextField.isHidden = !animalNameTextField.isHidden
        animalSpeciesTextField.isHidden = !animalSpeciesTextField.isHidden
        animalGenderTextField.isHidden = !animalGenderTextField.isHidden
    }
    
    func toggleEditMode(isEditMode: Bool) {
        self.isEditMode = isEditMode
        // toggles fields and text fields
        //if self.isEditMode {
            toggleAnimalTextFields()
            toggleAnimalLabels()
            toggleBabyAnimalLabels()
            print("Animal name label hidden: \(animalNameLabel.isHidden)")
            if self.animalData is BabyAnimal {
                toggleBabyAnimalTextFields()
            }
   //     }
    }
    
    @objc
    func editMode() {
        toggleEditMode(isEditMode: true)
        toggleEditOrSaveMode()
    }
    
    @objc
    func saveMode() {
        toggleEditMode(isEditMode: false)
        toggleEditOrSaveMode()
        
    }
    func toggleEditOrSaveMode() {
        if !isEditMode {
            let editBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(editMode))
            self.navigationItem.rightBarButtonItem = editBarButtonItem
        } else if isEditMode {
            let saveBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveMode))
            self.navigationItem.rightBarButtonItem = saveBarButtonItem
        }
    }
    
}
