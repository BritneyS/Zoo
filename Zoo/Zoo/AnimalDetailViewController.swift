//
//  AnimalDetailViewController.swift
//  Zoo
//
//  Created by Britney Smith on 9/13/18.
//  Copyright © 2018 Britney Smith. All rights reserved.
//

import UIKit

class AnimalDetailViewController: UIViewController {
    
    // MARK: Properties
    
    var animalData: Animal?

    override func viewDidLoad() {
        super.viewDidLoad()
        guard let animalData = self.animalData else { return }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Methods
    
    func setLabels() {
        
    }
    
    


}
