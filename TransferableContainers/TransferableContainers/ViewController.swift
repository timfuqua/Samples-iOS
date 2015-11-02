//
//  ViewController.swift
//  TransferableContainers
//
//  Created by Tim Fuqua on 11/2/15.
//  Copyright © 2015 FuquaProductions. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == "parent_to_TransferableCollectionVC" {
      if let transferableCollectionVC = segue.destinationViewController as? TransferableCollectionViewController {
        transferableCollectionVC.collectionViewDataSource = myCars
      }
    }
    else if segue.identifier == "parent_to_TransferableTableVC" {
      if let transferableTableVC = segue.destinationViewController as? TransferableTableViewController {
        transferableTableVC.tableViewDataSource = wishlistCars
      }
    }
  }
  
}

let myCars = [Car(year: "2001", make: "Audi", model: "A6 2.7T", color: "Black"), Car(year: "2008", make: "Mercury", model: "Mountaineer", color: "Tan")]
let wishlistCars = [Car(year: "2001", make: "BMW", model: "M Roadster", color: "Blue"), Car(year: "1999", make: "Lamborghini", model: "Diablo GT", color: "Yellow")]
