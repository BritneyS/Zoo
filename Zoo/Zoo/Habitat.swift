//
//  Habitat.swift
//  Zoo
//
//  Created by Britney Smith on 9/12/18.
//  Copyright © 2018 Britney Smith. All rights reserved.
//

import Foundation

class Habitat {
    var name: String
    var penID: [String]
    
    init(name: String, penID: [String]) {
        self.name = name
        self.penID = penID
    }
}

struct HabitatList {
    var habitats: [String:[String]] = ["Sahara":["Lion Pen", "Elephant Pen"],
                                    "Forest":["Monkey Pen","Snake Pen"],
                                    "Artic":["Polar Bear Pen","Penguin Pen"]]
}
