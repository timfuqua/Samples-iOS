// Playground - noun: a place where people can play

import UIKit

class Bar: Printable {
  
  var barName: String = ""
  var barValue: Int = 0
  
  var description: String {
    get {
      return barName + " - " + "\(barValue)"
    }
  }
  
  init(name: String, value: Int) {
    barName = name
    barValue = value
  }
  
}

class Foo: Printable {
  
  var barName: String = ""
  var bars: [Bar] = [] {
    didSet {
      bars.sort( { $0.barValue < $1.barValue } )
    }
  }
  
  var description: String {
    get {
      var fooString: String = barName
      
      for bar in bars {
        fooString += "\n\t" + bar.description
      }
      
      return fooString
    }
  }
  
  init(name: String) {
    barName = name
  }
  
}

let allBars = [
  Bar(name: "Bar1", value: 0)
  , Bar(name: "Bar1", value: 1)
  , Bar(name: "Bar1", value: 2)
  , Bar(name: "Bar2", value: 0)
  , Bar(name: "Bar3", value: 0)
  , Bar(name: "Bar2", value: 1)
]
var fooDictionary = [String : Foo]()

func buildFooDict() {
  
  for bar in allBars {
    if let foo = fooDictionary["\(bar.barName)"] {
      println("fooDictionary contains an entry for \(bar.barName)")
      println("Adding bar: \(bar.description)")
      foo.bars.append(bar)
    }
    else {
      println("fooDictionary does not contain an entry for \(bar.barName)")
      var newFoo = Foo(name: bar.barName)
      newFoo.bars.append(bar)
      println("Adding bar: \(bar.description) to newFoo")
      println(newFoo.description)
      fooDictionary.updateValue(newFoo, forKey: newFoo.barName)
    }
  }
  
}

buildFooDict()

var fooDictKeys: [String] {
  get {
    var keys = fooDictionary.keys.array
    keys.sort({ $0 < $1 })
    return keys
  }
}

println()
println("fooDictionary:")
for fooName in fooDictKeys {
  if let foo = fooDictionary[fooName] {
    println(foo.description)
  }
}
