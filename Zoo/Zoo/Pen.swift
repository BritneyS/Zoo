//
//  Pen.swift
//  Zoo
//
//  Created by Britney Smith on 9/12/18.
//  Copyright © 2018 Britney Smith. All rights reserved.
//

import Foundation

class Pen: NSObject {
    var name: String
    var animals: [Animal]
    
    init(name: String, animals: [Animal]) {
        self.name = name
        self.animals = animals
    }
}

struct PenList {
    var pens: [String:[Animal]] = ["Lion Pen":[],
                                   "Elephant Pen":[],
                                   "Monkey Pen":[],
                                   "Snake Pen":[],
                                   "Polar Bear Pen":[],
                                   "Penguin Pen":[]]
}
