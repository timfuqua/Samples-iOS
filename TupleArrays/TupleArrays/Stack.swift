//
//  Stack.swift
//  TupleArrays
//
//  Created by Tim Fuqua on 2/2/15.
//  Copyright (c) 2015 FuquaProductions. All rights reserved.
//

struct IntStack {
    
    var items = [Int]()
    
    mutating func push(item: Int) {
        items.append(item)
    }
    
    mutating func pop() -> Int? {
        return items.isEmpty ? nil : items.removeLast()
    }
}

struct DoubleStack {
    
    var items = [Double]()
    
    mutating func push(item: Double) {
        items.append(item)
    }
    
    mutating func pop() -> Double? {
        return items.isEmpty ? nil : items.removeLast()
    }
}

struct StringStack {
    
    var items = [String]()
    
    mutating func push(item: String) {
        items.append(item)
    }
    
    mutating func pop() -> String? {
        return items.isEmpty ? nil : items.removeLast()
    }
}

struct Stack<T> {
    
    var items = [T]()
    
    mutating func push(item: T) {
        items.append(item)
    }
    
    mutating func pop() -> T? {
        return items.isEmpty ? nil : items.removeLast()
    }
}

extension Stack {
    
    func topItem() -> T? {
        return items.isEmpty ? nil : items[items.count - 1]
    }
}

extension Stack: Container {

    // conformance to the Container protocol
    mutating func append(item: T) {
        self.push(item)
    }
    
    var count: Int {
        return items.count
    }
    
    subscript(i: Int) -> T {
        return items[i]
    }
}
