//: Playground - noun: a place where people can play

import UIKit



class Item {
  
  var name: String = ""
  
  init(name: String) {
    self.name = name
  }
  
}

class Inventory {
  
//  enum InventoryManagementResult
  
  typealias Items = [String : [Item]]
  
  private let kMaxCountPerItem: Int = 99
  
  private(set) var contents: Items!
  
  init() {
    contents = Items()
  }
  
  func addItem(named: String) {
    if let itemsEntry = contents[named] {
      
    }
    else {
      
    }
  }
  
}