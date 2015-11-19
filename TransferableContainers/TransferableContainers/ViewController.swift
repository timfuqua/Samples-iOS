//
//  ViewController.swift
//  TransferableContainers
//
//  Created by Tim Fuqua on 11/2/15.
//  Copyright © 2015 FuquaProductions. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var leftCarsContainerView: UIView!
  @IBOutlet weak var rightCarsContainerView: UIView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == "parent_to_TransferableCollectionVC" {
      if let transferableCollectionVC = segue.destinationViewController as? TransferableCollectionViewController {
        transferableCollectionVC.collectionViewDataSource = myCars
        transferableCollectionVC.transferableController = self
      }
    }
    else if segue.identifier == "parent_to_TransferableTableVC" {
      if let transferableTableVC = segue.destinationViewController as? TransferableTableViewController {
        transferableTableVC.tableViewDataSource = wishlistCars
        transferableTableVC.transferableController = self
      }
    }
  }
  
}

extension ViewController: TransferableController {
  
  func contentDidStartMoving(longPress: UILongPressGestureRecognizer) {
    print("")
    print("ViewController::contentDidStartMoving:")
    
    if CGRectContainsPoint(leftCarsContainerView.bounds, longPress.locationInView(leftCarsContainerView)) {
      print("In left view: ", terminator: "")
      
      let touchPoint = longPress.locationInView(leftCarsContainerView)
      print(touchPoint)
    }
    else if CGRectContainsPoint(rightCarsContainerView.bounds, longPress.locationInView(rightCarsContainerView)) {
      print("In right view: ", terminator: "")
      
      let touchPoint = longPress.locationInView(rightCarsContainerView)
      print(touchPoint)
    }
  }
  
  func contentMoving(longPress: UILongPressGestureRecognizer) {
    print("")
    print("ViewController::contentMoving:")
    
    if CGRectContainsPoint(leftCarsContainerView.bounds, longPress.locationInView(leftCarsContainerView)) {
      print("In left view: ", terminator: "")
      
      let touchPoint = longPress.locationInView(leftCarsContainerView)
      print(touchPoint)
    }
    else if CGRectContainsPoint(rightCarsContainerView.bounds, longPress.locationInView(rightCarsContainerView)) {
      print("In right view: ", terminator: "")
      
      let touchPoint = longPress.locationInView(rightCarsContainerView)
      print(touchPoint)
    }
  }
  
  func contentDidEndMoving(longPress: UILongPressGestureRecognizer) {
    print("")
    print("ViewController::contentDidEndMoving:")
    
    if CGRectContainsPoint(leftCarsContainerView.bounds, longPress.locationInView(leftCarsContainerView)) {
      print("In left view: ", terminator: "")
      
      let touchPoint = longPress.locationInView(leftCarsContainerView)
      print(touchPoint)
    }
    else if CGRectContainsPoint(rightCarsContainerView.bounds, longPress.locationInView(rightCarsContainerView)) {
      print("In right view: ", terminator: "")
      
      let touchPoint = longPress.locationInView(rightCarsContainerView)
      print(touchPoint)
    }
  }
  
}

let myCars = [Car(year: "2001", make: "Audi", model: "A6 2.7T", color: "Black"), Car(year: "2008", make: "Mercury", model: "Mountaineer", color: "Tan")]
let wishlistCars = [Car(year: "2001", make: "BMW", model: "M Roadster", color: "Blue"), Car(year: "1999", make: "Lamborghini", model: "Diablo GT", color: "Yellow")]
