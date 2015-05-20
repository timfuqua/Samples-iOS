//
//  ViewController.swift
//  OptionsPopover
//
//  Created by Tim Fuqua on 5/19/15.
//  Copyright (c) 2015 FuquaProductions. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var buttonA: UIButton!
  @IBOutlet weak var buttonB: UIButton!
  @IBOutlet weak var buttonC: UIButton!
  @IBOutlet weak var buttonD: UIButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  @IBAction func buttonAPressed(sender: UIButton) {
    println("buttonAPressed")
  }
  
  @IBAction func buttonBPressed(sender: UIButton) {
    println("buttonBPressed")
  }
  
  @IBAction func buttonCPressed(sender: UIButton) {
    println("buttonCPressed")
  }
  
  @IBAction func buttonDPressed(sender: UIButton) {
    println("buttonDPressed")
  }
  
}

