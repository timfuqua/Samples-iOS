//
//  TupleArraysTests.swift
//  TupleArraysTests
//
//  Created by Tim Fuqua on 2/2/15.
//  Copyright (c) 2015 FuquaProductions. All rights reserved.
//

import UIKit
import XCTest

class TupleArraysTests: XCTestCase {

    var myIntStack: IntStack = IntStack()
    var myDoubleStack: DoubleStack = DoubleStack()
    var myStringStack: StringStack = StringStack()
    var myGenericIntStack: Stack<Int> = Stack<Int>()
    var myGenericDoubleStack: Stack<Double> = Stack<Double>()
    var myGenericStringStack: Stack<String> = Stack<String>()

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
//    func testExample() {
//        // This is an example of a functional test case.
//        XCTAssert(true, "Pass")
//    }
//    
//    func testPerformanceExample() {
//        // This is an example of a performance test case.
//        self.measureBlock() {
//            // Put the code you want to measure the time of here.
//        }
//    }

    func testIntStackRemoveEmpty() {
        var result: Int? = myIntStack.pop()
        XCTAssert(result == nil, "PASS")
    }
    
    func testIntStackAddEmpty() {
        myIntStack.push(1)
        
        XCTAssert(myIntStack.items[0] == 1, "PASS")
    }

    func testDoubleStackRemoveEmpty() {
        var result: Double? = myDoubleStack.pop()
        XCTAssert(result == nil, "PASS")
    }
    
    func testDoubleStackAddEmpty() {
        myDoubleStack.push(1.1)
        XCTAssert(myDoubleStack.items[0] == 1.1, "PASS")
    }
    
    func testStringStackRemoveEmpty() {
        var result: String? = myStringStack.pop()
        XCTAssert(result == nil, "PASS")
    }
    
    func testStringStackAddEmpty() {
        myStringStack.push("Hello")
        XCTAssert(myStringStack.items[0] == "Hello", "PASS")
    }
    
    // Generic stack test cases
    func testGenericIntStackRemoveEmpty() {
        var result: Int? = myGenericIntStack.pop()
        XCTAssert(result == nil, "PASS")
    }
    
    func testGenericIntStackTopItemEmpty() {
        var result: Int? = myGenericIntStack.topItem()
        XCTAssert(result == nil, "PASS")
    }
    
    func testGenericIntStackAddEmpty() {
        myGenericIntStack.push(1)
        XCTAssert(myGenericIntStack.items[0] == 1, "PASS")
    }
    
    func testGenericIntStackAddEmptyThenTopItem() {
        myGenericIntStack.push(1)
        XCTAssert(myGenericIntStack.items[0] == 1, "PASS")
        
        var result: Int? = myGenericIntStack.topItem()
        XCTAssert(result != nil, "PASS")
        XCTAssert(result! == 1, "PASS")
        XCTAssert(myGenericIntStack.items[0] == 1, "PASS")
    }
    
    func testGenericDoubleStackRemoveEmpty() {
        var result: Double? = myGenericDoubleStack.pop()
        XCTAssert(result == nil, "PASS")
    }
    
    func testGenericDoubleStackAddEmpty() {
        myGenericDoubleStack.push(1.1)
        XCTAssert(myGenericDoubleStack.items[0] == 1.1, "PASS")
    }
    
    func testGenericStringStackRemoveEmpty() {
        var result: String? = myGenericStringStack.pop()
        XCTAssert(result == nil, "PASS")
    }
    
    func testGenericStringStackAddEmpty() {
        myGenericStringStack.push("Hello")
        XCTAssert(myGenericStringStack.items[0] == "Hello", "PASS")
    }
}
