//
//  Animal.swift
//  DictionaryOfArrayValues
//
//  Created by Tim Fuqua on 12/14/15.
//  Copyright © 2015 FuquaProductions. All rights reserved.
//

import Foundation

// MARK: Animal
/**
An animal! It has a name, a height, and a weight!
*/
class Animal: NSObject {
  
  // MARK: class vars
  // MARK: private lets
  // MARK: private vars (computed)
  // MARK: private vars
  // MARK: private(set) vars
  // MARK: lets
  // MARK: vars (computed)
  // MARK: vars
  
  var name: String!
  var friendlyName: String? = nil
  var heightInMeters: Double!
  var weightInKilograms: Double!
  
  // MARK: init
  init(name: String, friendlyName: String? = nil, height: Double, weight: Double) {
    self.name = name
    self.friendlyName = friendlyName
    self.heightInMeters = height
    self.weightInKilograms = weight
  }
  
  // MARK: public funcs
  
  func animalDescription() -> String {
    return (self.friendlyName != nil ? "\(self.friendlyName!) is a \(self.name)" : "Name: \(self.name)") + "  Height: \(self.heightInMeters.roundToPlaces(2)) m  Weight: \(self.weightInKilograms.roundToPlaces(2)) kg"
  }

  // MARK: private funcs
  
}

extension Animal {
  
  override var description: String {
    get {
      return animalDescription()
    }
  }
  
}

let ellyTheElephant = Animal(name: "Elephant", friendlyName: "Elly", height: 3.0, weight: 3000.0)
let brutusTheElephant = Animal(name: "Elephant", friendlyName: "Brutus", height: 4.0, weight: 5000.0)
let leoTheLion = Animal(name: "Lion", friendlyName: "Leo", height: 1.5, weight: 200.0)

func makeAMonkey() -> Animal {
  return Animal(name: "Monkey", height: 0.5 + drand48()/2.0, weight: 2.5 + 2.5*drand48())
}

extension Double {
  /// Rounds the double to decimal places value
  func roundToPlaces(places:Int) -> Double {
    let divisor = pow(10.0, Double(places))
    return round(self * divisor) / divisor
  }
}
