// Playground - noun: a place where people can play

import UIKit

class Parent {
    
    var StringProp:String
    var IntProp:Int
    
    init () {
        
        self.StringProp = "Parent"
        self.IntProp = 0
    }
    
    func GetString () -> String {
        
        return self.StringProp
    }
    
    func GetInt () -> Int {
    
        return self.IntProp
    }
    
    class func AlwaysPrintsHello () {
        
        println("Hello")
    }
}

class Child : Parent {
    
    override init () {
        
        super.init ()
        
        self.StringProp = "Child"
        self.IntProp = 1
    }
}

var a = Parent()
var b = Child()

a.GetString()
a.GetInt()
b.GetString()
b.GetInt()

Parent.AlwaysPrintsHello()
Child.AlwaysPrintsHello()
