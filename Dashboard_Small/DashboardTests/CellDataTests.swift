//
//  CellDataTests.swift
//  Dashboard
//
//  Created by Tim Fuqua on 1/21/15.
//  Copyright (c) 2015 stephen zhou. All rights reserved.
//

import UIKit
import XCTest

class CellDataTests: XCTestCase {

    func testRemoveBelowRange() {
        var data: CellData = CellData()
        XCTAssert(data.removeEntry(-1) == false, "PASS")
    }
    
    func testRemoveAboveRange() {
        var data: CellData = CellData()
        XCTAssert(data.removeEntry(4) == false, "PASS")
    }
    
    func testRemoveFirst() {
        var data: CellData = CellData()
        
        var removeShouldReturnTrue = data.removeEntry(0)
        var firstLeftShouldBeNil = (data.left[0] == nil)
        var firstRightShouldBeNil = (data.right[0] == nil)
        
        XCTAssert(removeShouldReturnTrue && firstLeftShouldBeNil && firstRightShouldBeNil, "PASS")
    }
    
    func testRemoveLast() {
        var data: CellData = CellData()
        
        var removeShouldReturnTrue = data.removeEntry(data.kMaxEntriesAllowed-1)
        var lastLeftShouldBeNil = (data.left[data.kMaxEntriesAllowed-1] == nil)
        var lastRightShouldBeNil = (data.right[data.kMaxEntriesAllowed-1] == nil)
        
        XCTAssert(removeShouldReturnTrue && lastLeftShouldBeNil && lastRightShouldBeNil, "PASS")
    }
}
