//
//  ViewController.swift
//  BondSample
//
//  Created by Tim Fuqua on 5/26/15.
//  Copyright (c) 2015 FuquaProductions. All rights reserved.
//

import UIKit
import Foundation
import Bond

class ViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    test01()
    test02()
  }
  
  private func test01() {
    println("**** Starting test01 ****")
    
    let dynamicInt = Dynamic<Int>(0)
    var newValue = NSNotFound
    let intBond = Bond<Int>({ value in
      newValue = value
    })
    
    println("newValue is initialized to NSNotFound: \(newValue)")
    
    // act
    intBond.bind(dynamicInt)
    
    if newValue == 0 {
      println("newValue was correctly updated to 0: \(newValue)")
    }
    
    // act: change the value to 1
    dynamicInt.value = 1
    
    if newValue == 1 {
      println("newValue was correctly updated to 1: \(newValue)")
    }
    
    println("**** Ending test01 ****\n")
  }
  
  private func test02() {
    println("**** Starting test02 ****")
    
    var dynamicDriver = Dynamic<String>("b")
    let label = UILabel()
    
    label.text = "a"
    println("label.text is initialized to \"a\": \(label.text!)")
    
    dynamicDriver ->> label.designatedBond
//    XCTAssert(label.text == "b", "Value after binding")
    println("dynamicDriver has been initialized with the value \"b\" and bound to label.designatedBond, so label.text should now be \"b\" as well: \(label.text!)")
    
    dynamicDriver.value = "c"
//    XCTAssert(label.text == "c", "Value after dynamic change")
    println("dynamicDriver's value has been updated with the value \"c\", so label.text should now be \"c\" as well: \(label.text!)")
    
    println("**** Ending test02 ****\n")
  }
  
  private func test03() {
    println("**** Starting test03 ****")
    
    println("**** Ending test03 ****\n")
  }
  
}

