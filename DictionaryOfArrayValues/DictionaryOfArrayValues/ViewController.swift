//
//  ViewController.swift
//  DictionaryOfArrayValues
//
//  Created by Tim Fuqua on 12/14/15.
//  Copyright © 2015 FuquaProductions. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    testNewZoo()
    testCatZoo()
    testNewZooWithCats()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  private func testNewZoo() {
    print("")
    print("testNewZoo:")
    
    let newZoo: Zoo<Animal> = Zoo<Animal>()
    
    newZoo.addAnimal(ellyTheElephant)
    newZoo.addAnimal(brutusTheElephant)
    newZoo.addAnimal(leoTheLion)
    newZoo.addAnimal(makeAMonkey())
    newZoo.addAnimal(makeAMonkey())
    newZoo.addAnimal(makeAMonkey())
    newZoo.addAnimal(makeAMonkey())
    
    print("newZoo contents: \(newZoo.description)")
  }
  
  private func testCatZoo() {
    print("")
    print("testCatZoo:")
    
    let catZoo: Zoo<HouseCat> = Zoo<HouseCat>()
    
    catZoo.addAnimal(lily)
    catZoo.addAnimal(hunter)
    
    print("catZoo contents: \(catZoo.description)")
  }
  
  private func testNewZooWithCats() {
    print("")
    print("testNewZooWithCats:")
    
    let newZoo: Zoo<Animal> = Zoo<Animal>()
    
    newZoo.addAnimal(ellyTheElephant)
    newZoo.addAnimal(brutusTheElephant)
    newZoo.addAnimal(leoTheLion)
    newZoo.addAnimal(makeAMonkey())
    newZoo.addAnimal(makeAMonkey())
    newZoo.addAnimal(makeAMonkey())
    newZoo.addAnimal(makeAMonkey())
    newZoo.addAnimal(lily)
    newZoo.addAnimal(hunter)
    
    print("newZoo contents: \(newZoo.description)")
  }

}

