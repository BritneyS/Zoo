//
//  AnimalDetailViewController.swift
//  Zoo
//
//  Created by Britney Smith on 9/13/18.
//  Copyright © 2018 Britney Smith. All rights reserved.
//

import UIKit

protocol AnimalDetailViewControllerDelegate: class {
    func animalDetailViewControllerDidCancel(_ controller: AnimalDetailViewController)
    func addAnimalViewControllerEdit(_ controller: AnimalDetailViewController, didFinishEditing item: Animal)
}

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
   var babyAnimalData: BabyAnimal?
    var isEditMode = false // where if in editing mode, bar button is 'Save', else 'Edit'
    

    override func viewDidLoad() {
        super.viewDidLoad()
        hideAllTextFields()
        if babyAnimalData != nil {
            setBabyAnimalLabels()
        }
        else {
            setAnimalLabels()
        }
        
        toggleEditOrSaveMode() // test
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    // MARK: Methods
    
    func setAnimalLabels() {
        animalNameLabel.text = animalData?.name
        animalSpeciesLabel.text = animalData?.species
        animalGenderLabel.text = animalData?.gender
        toggleBabyAnimalLabels()
    }
    
    func setBabyAnimalLabels() {
        animalNameLabel.text = babyAnimalData?.name
        animalSpeciesLabel.text = babyAnimalData?.species
        animalGenderLabel.text = babyAnimalData?.gender
        animalAgeLabel.text = babyAnimalData?.age
    }
    
    func toggleBabyAnimalLabels() {
        animalAgeLabel.isHidden = !animalAgeLabel.isHidden
    }
    
    func setAllAnimalTextFields() {
        animalNameTextField.text = animalData?.name
        animalSpeciesTextField.text = animalData?.species
        animalGenderTextField.text = animalData?.gender
        if animalData is BabyAnimal? {
            guard let babyAnimal = (animalData as? BabyAnimal) else { return }
            animalAgeTextField.text = babyAnimal.age
        }
    }
    
    func hideAllTextFields() {
        animalNameTextField.isHidden = true
        animalSpeciesTextField.isHidden = true
        animalGenderTextField.isHidden = true
        animalAgeTextField.isHidden = true
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
        toggleAnimalTextFields()
        toggleAnimalLabels()
        toggleBabyAnimalLabels()
        if self.animalData is BabyAnimal {
            toggleBabyAnimalTextFields()
        }
    }
    
    @objc
    func editMode() {
        toggleEditMode(isEditMode: true)
        toggleEditOrSaveMode()
        setAllAnimalTextFields()
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
