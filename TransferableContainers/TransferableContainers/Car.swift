//
//  Car.swift
//  TransferableContainers
//
//  Created by Tim Fuqua on 11/2/15.
//  Copyright © 2015 FuquaProductions. All rights reserved.
//

import Foundation

// MARK: Car
/**
*/
class Car {
  
  // MARK: class vars
  // MARK: private lets
  // MARK: private vars (computed)
  // MARK: private vars
  // MARK: private(set) vars
  // MARK: lets
  // MARK: vars (computed)
  // MARK: vars
  
  /// The year of the car
  var year: String!
  
  /// The make of the car
  var make: String!
  
  /// The model of the car
  var model: String!
  
  /// The color of the car
  var color: String!
  
  /// The image of the car
  var image: String {
    get {
      return (year + make + model).lowercaseString.stringByReplacingOccurrencesOfString(".", withString: "").stringByReplacingOccurrencesOfString(" ", withString: "")
    }
  }
  
  // MARK: init
  
  init(year: String, make: String, model: String, color: String) {
    self.year = year
    self.make = make
    self.model = model
    self.color = color
  }
  
  // MARK: public funcs
  
  // MARK: private funcs
  
}
