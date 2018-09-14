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
    
    @IBOutlet weak var editOrSaveBarButtonItem: UIBarButtonItem!
    
    
    
    
    // MARK: Properties
    
    var animalData: Animal?
    var isEditMode = false // where if in editing mode, bar button is 'Save', else 'Edit'
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setAnimalLabels()
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
    
    func setBabyAnimalLabels() {
        guard let babyAnimal = (animalData as? BabyAnimal) else { return }
        animalAgeLabel.text = babyAnimal.age
    }
    
    func toggleBabyAnimalLabels() {
        animalAgeLabel.isHidden = !animalAgeLabel.isHidden
    }
    
    func toggleAnimalLabels() {
        animalAgeLabel.isHidden = !animalAgeLabel.isHidden
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
    }
    
    @objc
    func editMode() {
        
    }
    
    @objc
    func saveMode() {
        
    }
    func toggleEditOrSaveMode() {
        if isEditMode {
            editOrSaveBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(AnimalDetailViewController.editMode))
        } else if !isEditMode {
            editOrSaveBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(AnimalDetailViewController.saveMode))
        }
    }
    
}
