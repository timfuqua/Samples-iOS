//
//  HouseCat.swift
//  DictionaryOfArrayValues
//
//  Created by Tim Fuqua on 12/15/15.
//  Copyright © 2015 FuquaProductions. All rights reserved.
//

import Foundation

// MARK: HouseCat
/**

*/
class HouseCat: Animal {
  
  // MARK: class vars
  // MARK: private lets
  // MARK: private vars (computed)
  // MARK: private vars
  // MARK: private(set) vars
  // MARK: lets
  // MARK: vars (computed)
  // MARK: vars
  
  var type: String!
  var favoriteToy: String!
  
  // MARK: init
  init(friendlyName: String? = nil, height: Double, weight: Double, type: String, favoriteToy: String) {
    super.init(name: "HouseCat", friendlyName: friendlyName, height: height, weight: weight)
    
    self.type = type
    self.favoriteToy = favoriteToy
  }
  
  // MARK: public funcs

  // MARK: private funcs
  
  override func animalDescription() -> String {
    return (self.friendlyName != nil ? "\(self.friendlyName!) is a \(self.type) \(self.name) that loves to play with \(self.favoriteToy)" : "Name: \(self.name)") + "  Height: \(self.heightInMeters.roundToPlaces(2)) m  Weight: \(self.weightInKilograms.roundToPlaces(2)) kg"
  }
  
}

let lily = HouseCat(friendlyName: "Lily", height: 0.3, weight: 3.5, type: "Crazy", favoriteToy: "Humans")
let hunter = HouseCat(friendlyName: "Hunter", height: 0.4, weight: 6, type: "Orange", favoriteToy: "The Wife")
