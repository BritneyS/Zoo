//
//  Animal.swift
//  Zoo
//
//  Created by Britney Smith on 9/12/18.
//  Copyright © 2018 Britney Smith. All rights reserved.
//

import Foundation

class Animal: NSObject, Codable {
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

class AnimalList {
    var animals: [String:(animalArray: [Animal], babyAnimalArray: [BabyAnimal])] =
        [
            "Lion Pen":(animalArray: [Animal(species: "lion", gender: "female", name: "Lily Lion")], babyAnimalArray: []),
            "Elephant Pen":(animalArray: [Animal(species: "elephant", gender: "male", name: "Edward Elephant")], babyAnimalArray: []),
            "Monkey Pen":(animalArray: [Animal(species: "monkey", gender: "female", name: "Maya Monkey")], babyAnimalArray: []),
            "Snake Pen":(animalArray: [Animal(species: "snake", gender: "female", name: "Sally Snake")], babyAnimalArray: []),
            "Polar Bear Pen":(animalArray: [Animal(species: "polar bear", gender: "male", name: "Benjamin Bear")], babyAnimalArray: []),
            "Penguin Pen":(animalArray: [], babyAnimalArray: [BabyAnimal(age: "2", species: "penguin", gender: "female", name: "Penny Penguin")])
        ]
}

