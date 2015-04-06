// Playground - noun: a place where people can play

import UIKit

// http://stackoverflow.com/questions/25542630/swift-array-find-by-identity/25543084#25543084
func findIdenticalObject<T : AnyObject>(array: [T], value: T) -> Int? {
  for (index, elem) in enumerate(array) {
    if elem === value {
      return index
    }
  }
  return nil
}

protocol SomeDelegate: class {
  func someFunc()
}

// http://stackoverflow.com/questions/27532897/find-delegate-in-a-swift-array-of-delegates
var delegates = [SomeDelegate]()

func removeDelegate(delegate: SomeDelegate) {
  if let index = findIdenticalObject(delegates, delegate) {
    println("Removing delegate")
    delegates.removeAtIndex(index)
  }
  else {
    println("Delegate not found")
  }
}

class FirstClass: SomeDelegate {
  
  init() {
    delegates.append(self)
  }
  
  func someFunc() {
    println("FirstClass: someFunc()")
  }
  
}

class SecondClass: SomeDelegate {
  
  init() {
    delegates.append(self)
  }
  
  func someFunc() {
    println("SecondClass: someFunc()")
  }
  
}

let first = FirstClass()
let second = SecondClass()
println(delegates.count)

removeDelegate(first)
println(delegates.count)

removeDelegate(first)
println(delegates.count)

removeDelegate(second)
println(delegates.count)


