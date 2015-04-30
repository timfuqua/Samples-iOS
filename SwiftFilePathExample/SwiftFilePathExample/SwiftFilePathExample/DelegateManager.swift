//
//  DelegateManager.swift
//  SwiftFilePathExample
//
//  Created by Tim Fuqua on 4/30/15.
//  Copyright (c) 2015 FuquaProductions. All rights reserved.
//

import Foundation

// http://stackoverflow.com/questions/25542630/swift-array-find-by-identity/25543084#25543084
func findIdenticalObject<T : AnyObject>(array: [T], value: T) -> Int? {
  for (index, elem) in enumerate(array) {
    if elem === value {
      return index
    }
  }
  return nil
}

class DelegateManager<T where T: AnyObject> {
  
  private(set) var delegateName: String = ""
  private(set) var delegates: [T] = []
  
  init(delegateName: String) {
    self.delegateName = delegateName
  }
  
  func subscribe(delegate: T) {
    delegates.append(delegate)
  }
  
  func unsubscribe(delegate: T) {
    if let index = findIdenticalObject(delegates, delegate) {
      delegates.removeAtIndex(index)
    }
  }
  
}
