//
//  CellData.swift
//  Dashboard
//
//  Created by Tim Fuqua on 1/21/15.
//  Copyright (c) 2015 stephen zhou. All rights reserved.
//

import Foundation

class CellData {
    
    let kMaxEntriesAllowed: Int = 4
    
    var name: String = "DEFAULT"
    var left: [String?] = [nil, nil, nil, nil]
    var right: [String?] = [nil, nil, nil, nil]
    
    var left1: String? {
        get { return left[0] }
        set(value) { left[0] = value }
    }
    
    var right1: String? {
        get { return right[0] }
        set(value) { right[0] = value }
    }
    
    var left2: String? {
        get { return left[1] }
        set(value) { left[1] = value }
    }
    
    var right2: String? {
        get { return right[1] }
        set(value) { right[1] = value }
    }
    
    var left3: String? {
        get { return left[2] }
        set(value) { left[2] = value }
    }
    
    var right3: String? {
        get { return right[2] }
        set(value) { right[2] = value }
    }
    
    var left4: String? {
        get { return left[3] }
        set(value) { left[3] = value }
    }
    
    var right4: String? {
        get { return right[3] }
        set(value) { right[3] = value }
    }
    
    init() {
    }
    
    init(name: String) {
        self.name = name
    }
    
    init(name: String, left: String, right: String) {
        self.name = name
        left1 = left
        right1 = right
    }
    
    init(name: String, left1: String, right1: String, left2: String, right2: String) {
        self.name = name
        self.left1 = left1
        self.right1 = right1
        self.left2 = left2
        self.right2 = right2
    }
    
    init(name: String, left1: String, right1: String, left2: String, right2: String, left3: String, right3: String) {
        self.name = name
        self.left1 = left1
        self.right1 = right1
        self.left2 = left2
        self.right2 = right2
        self.left3 = left3
        self.right3 = right3
    }
    
    init(name: String, left1: String, right1: String, left2: String, right2: String, left3: String, right3: String, left4: String, right4: String) {
        self.name = name
        self.left1 = left1
        self.right1 = right1
        self.left2 = left2
        self.right2 = right2
        self.left3 = left3
        self.right3 = right3
        self.left4 = left4
        self.right4 = right4
    }
    
    init(name: String, left: [String?], right: [String?]) {
        self.name = name
        
        if left.count != right.count {
            return
        }
        else if left.count > kMaxEntriesAllowed {
            return
        }
        
        for var i=0; i<kMaxEntriesAllowed; ++i {
            insertEntryUnchecked(left[i], right: right[i], atIndex: i)
        }
        
    }
    
    func isValidIndex(atIndex: Int) -> Bool {
        return atIndex >= 0 && atIndex < kMaxEntriesAllowed
    }
    
    func printCellData(newLine: Bool = true) {
        println(name)
        for var i=0; i<kMaxEntriesAllowed; ++i {
            print("\(left[i])\t\t")
            println(right[i])
        }
        
        if newLine {
            println()
        }
    }
    
    func printCellDataUnwrapped(newLine: Bool = true) {
        println(name)
        for var i=0; i<kMaxEntriesAllowed; ++i {
            if left[i] != nil {
                print("\(left[i]!)\t\t")
            }
            else {
                print("\(left[i])\t\t")
            }
            
            if right[i] != nil {
                println("\(right[i]!)")
            }
            else {
                println("\(right[i])")
            }
        }
        
        if newLine {
            println()
        }
    }
    
    func addEntry(left: String?, right: String?) -> Bool {
        for var i=0; i<kMaxEntriesAllowed; ++i {
            if self.left[i] == nil && self.right[i] == nil {
                return insertEntryUnchecked(left, right: right, atIndex: i)
            }
        }
        
        return false
    }
    
    func removeEntry(atIndex: Int) -> Bool {
        if isValidIndex(atIndex) {
            return insertEntryUnchecked(nil, right: nil, atIndex: atIndex)
        }
        else {
            return false
        }
    }
    
    func insertEntry(left: String?, right: String?, atIndex: Int) -> Bool {
        if isValidIndex(atIndex) {
            return insertEntryUnchecked(left, right: right, atIndex: atIndex)
        }
        else {
            return false
        }
    }
    
    func insertEntryUnchecked(left: String?, right: String?, atIndex: Int) -> Bool {
        self.left[atIndex] = left
        self.right[atIndex] = right
        
        return true
    }
    
    func getEntry(atIndex: Int) -> (String?, String?) {
        if isValidIndex(atIndex) {
            return (left[atIndex], right[atIndex])
        }
        else {
            return (nil, nil)
        }
    }

}
