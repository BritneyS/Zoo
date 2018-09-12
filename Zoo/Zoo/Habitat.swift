//
//  Habitat.swift
//  Zoo
//
//  Created by Britney Smith on 9/12/18.
//  Copyright © 2018 Britney Smith. All rights reserved.
//

import Foundation

class Habitat: NSObject {
    var name: String
    var pens: [Pen]
    
    init(name: String, pens: [Pen]) {
        self.name = name
        self.pens = pens
    }
}

struct HabitatList {
    var habitats: [String:[Pen]] = ["Sahara":[],
                                    "Forest":[],
                                    "Artic":[]]
}
