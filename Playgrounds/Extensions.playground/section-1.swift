// Playground - noun: a place where people can play

import UIKit

class Foo {
    struct Bar {
        var val1: Int?
        var val2: String?
        
        init(val1: Int? = nil, val2: String? = nil) {
            self.val1 = val1
            self.val2 = val2
        }
    }
    
    var data: [Bar?] = []
    
    func addBar(val1: Int? = nil, val2: String? = nil) {
        data.append(Bar(val1: val1, val2: val2))
    }
    
    func printData() {
        for entry in data {
            printOptional(entry?.val1)
            printOptional(entry?.val2)
        }
    }
    
    func printOptional(value: AnyObject?) {
        if value != nil {
            println(value!)
        }
        else {
            println(value)
        }
    }
}

extension Array {
    func get(index: Int) -> T? {
        return (0 <= index && index < count) ? self[index] : nil
    }
}

extension Foo {
    
    var firstVal1: Int? {
        get { return data.get(0)??.val1 }
        set(value) { data[0]?.val1 = value }
//        set(value) { data.set(0, value: value) }
//        set(value) { data.get(0)??.val1 = value }
    }
    
    var firstVal2: String? {
        get { return data.get(0)??.val2? }
        set(value) { data[0]?.val2 = value }
    }
}

func testEmpty() {
    println(__FUNCTION__)

    var foo = Foo()
    foo.printData()
    println(foo.firstVal1)
    println(foo.firstVal2)
    
    println()
}

func testEmptySetShorthand() {
    println(__FUNCTION__)
    
    var foo = Foo()
    foo.firstVal1 = 4
    foo.firstVal2 = "A"
    foo.printData()
    
    println()
}


func testSingleValue() {
    println(__FUNCTION__)
    
    var foo = Foo()
    foo.addBar(val1: 5, val2: "Text")
    foo.printData()
    
    println()
}

func testSingleValueShorthand() {
    println(__FUNCTION__)
    
    var foo = Foo()
    foo.addBar(val1: 5, val2: "Text")
    foo.printData()
    foo.firstVal1 = 6
    foo.firstVal2 = "Other Text"
    foo.printData()
    
    println()
}


testEmpty()
//testEmptySetShorthand()
testSingleValue()
testSingleValueShorthand()





