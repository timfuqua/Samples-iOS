// Playground - noun: a place where people can play

import UIKit

class Thing {

  var someInt: Int = 0
  var someArray: [Int] = [] {
    willSet {
      println("Thing: willSet \(someArray) to \(newValue)")
    }
    
    didSet {
      println("Thing: didSet \(oldValue) to \(someArray)")
    }
  }
  
}

class HasAThing {
  
  var myThing: Thing = Thing() {
    willSet {
      println("HasAThing: willSet \(myThing) to \(newValue)")
    }
    
    didSet {
      println("HasAThing: didSet \(oldValue) to \(myThing)")
    }
  }
  
}

func test1() {
  var t = Thing()
  t.someArray.append(1)
  t.someArray.append(2)
  t.someArray.append(3)
  
  t.someArray[0] = 10
  t.someArray[1] = 20
  t.someArray[2] = 30
}

//func test2() {
  var otherArray: [Int] = [] {
    willSet {
      println("willSet \(otherArray) to \(newValue)")
    }
    
    didSet {
      println("didSet \(oldValue) to \(otherArray)")
    }
  }
  
  otherArray.append(10)
  otherArray.append(20)
  otherArray.append(30)
  
  otherArray[0] = 100
  otherArray[1] = 200
  otherArray[2] = 300
//}
  
func test3() {
  var hat = HasAThing()
  hat.myThing.someInt = 1
  
  var otherThing = Thing()
  
  hat.myThing = otherThing
}

test1()
//test2()
test3()







