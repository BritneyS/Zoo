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
    var animalID: [String]
    //var habitatName: String
    
    init(name: String, animalID: [String]) {
        self.name = name
        self.animalID = animalID
        //self.habitatName = habitatName
    }
}

struct PenList {
    var pens: [String:[String]] = ["Lion Pen":["Lily Lion"],
                                   "Elephant Pen":["Edward Elephant"],
                                   "Monkey Pen":["Maya Monkey"],
                                   "Snake Pen":["Sally Snake"],
                                   "Polar Bear Pen":["Benjamin Bear"],
                                   "Penguin Pen":["Penny Penguin"]]
}

/*
 var animals: [String:[Animal]] = ["Lion Pen":[Animal(species: "lion", gender: "female", name: "Lily Lion")],
 "Elephant Pen":[Animal(species: "elephant", gender: "male", name: "Edward Elephat")],
 "Monkey Pen":[Animal(species: "monkey", gender: "female", name: "Maya Monkey")],
 "Snake Pen":[Animal(species: "snake", gender: "female", name: "Sally Snake")],
 "Polar Bear Pen":[Animal(species: "polar bear", gender: "male", name: "Benjamin Bear")],
 "Penguin Pen":[Animal(species: "penguin", gender: "female", name: "Penny Penguin")]]
 */
