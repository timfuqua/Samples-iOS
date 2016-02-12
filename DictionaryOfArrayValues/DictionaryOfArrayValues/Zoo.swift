//
//  Zoo.swift
//  DictionaryOfArrayValues
//
//  Created by Tim Fuqua on 12/14/15.
//  Copyright © 2015 FuquaProductions. All rights reserved.
//

import Foundation

// MARK: Zoo
/**
A zoo is a collection of animals. The inventory of the zoo is a dictionary that
uses the name of the animal as a key, and an array of all the animals of that
kind in the inventory
*/
class Zoo<T where T:Animal> {
  
  // MARK: class vars
  // MARK: private lets
  // MARK: private vars (computed)
  // MARK: private vars
  
  /**
  The cards represented by a dictionary that maps a card's string name to
  the quantity of that card in the deck
  */
  private var inventory: [String:[T]] = [String:[T]]()
  
  // MARK: private(set) vars
  // MARK: lets
  // MARK: vars (computed)
  // MARK: vars
  
  // MARK: init
  init() {
  }
  
  // MARK: public funcs
  
  func addAnimal(animal: T) {
    if inventory[animal.name] != nil {
      var newAnimals = inventory[animal.name]!
      
      newAnimals.append(animal)
      inventory.updateValue(newAnimals, forKey: animal.name)
    }
    else {
      var newAnimals = [T]()
      
      newAnimals.append(animal)
      inventory.updateValue([T](), forKey: animal.name)
      inventory.updateValue(newAnimals, forKey: animal.name)
    }
  }
  
  func removeAnimal(animal: T) -> T? {
    if inventory[animal.name] != nil {
      var newAnimals = inventory[animal.name]!
      let removedAnimal = newAnimals.removeFirst()
      
      inventory.updateValue(newAnimals, forKey: animal.name)
      
      return removedAnimal
    }
    else {
      return nil
    }
  }

  // MARK: private funcs
  private func zooDescription() -> String {
    var descriptionString = "\n[\n"
    
    for animalName in inventory.keys {
      precondition(inventory[animalName] != nil && inventory[animalName]!.count > 0)
      descriptionString += "\t"
      /// Cast to `Animal` due to apple bug
      descriptionString += "\(inventory[animalName]!.count)x \((inventory[animalName]![0] as Animal).description)\n"
    }
    
    descriptionString = String(descriptionString.characters.dropLast())
    descriptionString += "\n]"
    
    return descriptionString
  }
  
}

extension Zoo {
  
  var description: String {
    get {
      return zooDescription()
    }
  }
  
}
