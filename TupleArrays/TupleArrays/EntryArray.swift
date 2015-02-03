//
//  EntryArray.swift
//  TupleArrays
//
//  Created by Tim Fuqua on 2/2/15.
//  Copyright (c) 2015 FuquaProductions. All rights reserved.
//

import UIKit

class EntryArray<T>: SequenceType {
    
    private let kMaxEntriesAllowed: Int
    private var entries: [T?] = [T?]()
    
    // for Container protocol
    var count: Int = 0
    
    init(arraySize: Int) {
        
        kMaxEntriesAllowed = arraySize
        initializeEntries()
    }
    
    private func initializeEntries() {
        for _ in 1...kMaxEntriesAllowed {
            entries.append(nil)
        }
    }
    
    private func isValidIndex(atIndex: Int) -> Bool {
        return atIndex >= 0 && atIndex < kMaxEntriesAllowed
    }
    
    func addEntry(toAdd: T?) -> Bool {
        for var i=0; i<kMaxEntriesAllowed; ++i {
            if entries[i] == nil {
                return insertEntryUnchecked(toAdd, atIndex: i)
            }
        }
        
        return false
    }
    
     func removeEntry(atIndex: Int) -> Bool {
        if isValidIndex(atIndex) {
            return insertEntryUnchecked(nil, atIndex: atIndex)
        }
        else {
            return false
        }
    }
    
    func insertEntry(entry: T?, atIndex: Int) -> Bool {
        if isValidIndex(atIndex) {
            return insertEntryUnchecked(entry, atIndex: atIndex)
        }
        else {
            return false
        }
    }
    
    private func insertEntryUnchecked(entry: T?, atIndex: Int) -> Bool {
        
        if entry == nil {
            //removing
            count--
        }
        else if self.entries[atIndex] == nil {
            // adding
            count++
        }
        
        // replacing
        self.entries[atIndex] = entry
        
        return true
    }
    
    func getEntry(atIndex: Int) -> T? {
        if isValidIndex(atIndex) {
            return entries[atIndex]
        }
        else {
            return nil
        }
    }
    
    subscript(i:Int) -> T? {
        return entries[i]
    }
    
    // For SequenceType protocol
    func generate() -> IndexingGenerator<Array<T?>> {
        return entries.generate()
    }
    
}
