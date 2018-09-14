//
//  Animal.swift
//  Zoo
//
//  Created by Britney Smith on 9/12/18.
//  Copyright © 2018 Britney Smith. All rights reserved.
//

import Foundation

class Animal: NSObject {
    var species: String
    var gender: String
    var name: String 
    
    init(species: String, gender: String, name: String) {
        self.species = species
        self.gender = gender
        self.name = name
    }
}

class BabyAnimal: Animal {
    var age: String
    
    init(age: String, species: String, gender: String, name: String) {
        self.age = age
        super.init(species: species, gender: gender, name: name)
    }
    
    required init(from decoder: Decoder) throws {
        fatalError("init(from:) has not been implemented")
    }
}

struct AnimalList {
    var animals: [String:[Animal]] = ["Lion Pen":[Animal(species: "lion", gender: "female", name: "Lily Lion")],
                                      "Elephant Pen":[Animal(species: "elephant", gender: "male", name: "Edward Elephant")],
                                      "Monkey Pen":[Animal(species: "monkey", gender: "female", name: "Maya Monkey")],
                                      "Snake Pen":[Animal(species: "snake", gender: "female", name: "Sally Snake")],
                                      "Polar Bear Pen":[Animal(species: "polar bear", gender: "male", name: "Benjamin Bear")],
                                      "Penguin Pen":[BabyAnimal(age: "2", species: "penguin", gender: "female", name: "Penny Penguin")]]
}

