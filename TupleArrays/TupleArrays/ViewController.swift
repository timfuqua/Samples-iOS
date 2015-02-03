//
//  ViewController.swift
//  TupleArrays
//
//  Created by Tim Fuqua on 2/2/15.
//  Copyright (c) 2015 FuquaProductions. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    struct EntryData1 {
        var text: String?
        var backgroundColor: UIColor?
        var textColor: UIColor?

        init(text: String?, backgroundColor: UIColor? = UIColor.clearColor(), textColor: UIColor? = UIColor.blackColor()) {
            self.text = text
            self.backgroundColor = backgroundColor
            self.textColor = textColor
        }
        
        func printValues(newLine: Bool = true) {
            if text != nil {
                if textColor != nil {
                    print(textColor!.description)
                }
                else {
                    print(textColor?.description)
                }
                
                print(" \(text!) on ")

                if backgroundColor != nil {
                    print(backgroundColor!.description)
                }
                else {
                    print(backgroundColor?.description)
                }
                
                print(" background")
            }
            else {
                print(text)
            }
            
            if newLine {
                println()
            }
        }
    }
    
    struct EntryData2 {
        var text: String?
        var backgroundColor: String?
        var textColor: String?
        
        init(text: String?, backgroundColor: String? = nil, textColor: String? = nil) {
            self.text = text
            self.backgroundColor = backgroundColor
            self.textColor = textColor
        }
        
        func printValues(newLine: Bool = true) {
            if text != nil {
                if textColor != nil {
                    print(textColor!)
                }
                else {
                    print(textColor)
                }
                
                print(" \(text!) on ")
                
                if backgroundColor != nil {
                    print(backgroundColor!)
                }
                else {
                    print(backgroundColor)
                }
                
                print(" background")
            }
            else {
                print(text)
            }
            
            if newLine {
                println()
            }
        }
    }
    
    let kEntryListSize: Int = 4
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        testWithIntList()
//        testWithStringList()
//        testWithStruct1List()
//        testWithAnyList()
        testWithNestedAnyList()
    }

    private func testWithIntList() {
        var entryListInt: EntryArray<Int> = EntryArray<Int>(arraySize: kEntryListSize)
        printEntryDataInt(entryListInt)
        
        entryListInt.addEntry(1)
        entryListInt.addEntry(2)
        entryListInt.addEntry(3)
        entryListInt.addEntry(4)
        printEntryDataInt(entryListInt)
        
        entryListInt.addEntry(5)
        printEntryDataInt(entryListInt)
        
        entryListInt.insertEntry(5, atIndex: -1)
        entryListInt.insertEntry(5, atIndex: 4)
        printEntryDataInt(entryListInt)
        
        entryListInt.insertEntry(5, atIndex: 3)
        printEntryDataInt(entryListInt)
        
        entryListInt.removeEntry(1)
        entryListInt.removeEntry(2)
        printEntryDataInt(entryListInt)
        
        entryListInt.addEntry(6)
        entryListInt.addEntry(7)
        printEntryDataInt(entryListInt)
        
        entryListInt.removeEntry(0)
        entryListInt.removeEntry(3)
        entryListInt.insertEntry(8, atIndex: 3)
        entryListInt.addEntry(9)
        printEntryDataInt(entryListInt)
        
        println(entryListInt[0])
        println(entryListInt[1])
        println(entryListInt[2])
        println(entryListInt[3])
        println()
    }
    
    private func printEntryDataInt(entryList: EntryArray<Int>, newLine: Bool = true) {
        for number in entryList {
            if number != nil {
                println(number!)
            }
            else {
                println(number)
            }
        }

        println("Count: \(entryList.count)")
        
        if newLine {
            println()
        }
    }

    private func testWithStringList() {
        
        var entryListString: EntryArray<String> = EntryArray<String>(arraySize: kEntryListSize)
        printEntryDataString(entryListString)
        
        entryListString.addEntry("one")
        entryListString.addEntry("two")
        entryListString.addEntry("three")
        entryListString.addEntry("four")
        printEntryDataString(entryListString)
        
        entryListString.addEntry("five")
        printEntryDataString(entryListString)
        
        entryListString.insertEntry("five", atIndex: -1)
        entryListString.insertEntry("five", atIndex: 4)
        printEntryDataString(entryListString)
        
        entryListString.insertEntry("five", atIndex: 3)
        printEntryDataString(entryListString)
        
        entryListString.removeEntry(1)
        entryListString.removeEntry(2)
        printEntryDataString(entryListString)
        
        entryListString.addEntry("six")
        entryListString.addEntry("seven")
        printEntryDataString(entryListString)
        
        entryListString.removeEntry(0)
        entryListString.removeEntry(3)
        entryListString.insertEntry("eight", atIndex: 3)
        entryListString.addEntry("nine")
        printEntryDataString(entryListString)
        
        println(entryListString[0])
        println(entryListString[1])
        println(entryListString[2])
        println(entryListString[3])
        println()
    }
    
    private func printEntryDataString(entryList: EntryArray<String>, newLine: Bool = true) {
        for text in entryList {
            if text != nil {
                println(text!)
            }
            else {
                println(text)
            }
        }
        
        println("Count: \(entryList.count)")
        
        if newLine {
            println()
        }
    }
    
    private func testWithStruct1List() {
        
        var entryListStruct: EntryArray<EntryData1> = EntryArray<EntryData1>(arraySize: kEntryListSize)
        printEntryData1Struct(entryListStruct)
        
        entryListStruct.addEntry(EntryData1(text: "one", backgroundColor: UIColor.redColor(), textColor: UIColor.orangeColor()))
        entryListStruct.addEntry(EntryData1(text: "two", backgroundColor: UIColor.orangeColor(), textColor: UIColor.yellowColor()))
        entryListStruct.addEntry(EntryData1(text: "three", backgroundColor: UIColor.yellowColor(), textColor: UIColor.greenColor()))
        entryListStruct.addEntry(EntryData1(text: "four", backgroundColor: UIColor.greenColor(), textColor: UIColor.blueColor()))
        printEntryData1Struct(entryListStruct)
        
        entryListStruct.addEntry(EntryData1(text: "five", backgroundColor: UIColor.blueColor(), textColor: UIColor.purpleColor()))
        printEntryData1Struct(entryListStruct)
        
        entryListStruct.insertEntry(EntryData1(text: "five", backgroundColor: UIColor.blueColor(), textColor: UIColor.purpleColor()), atIndex: -1)
        entryListStruct.insertEntry(EntryData1(text: "five", backgroundColor: UIColor.blueColor(), textColor: UIColor.purpleColor()), atIndex: 4)
        printEntryData1Struct(entryListStruct)
        
        entryListStruct.insertEntry(EntryData1(text: "five", backgroundColor: UIColor.blueColor(), textColor: UIColor.purpleColor()), atIndex: 3)
        printEntryData1Struct(entryListStruct)
        
        entryListStruct.removeEntry(1)
        entryListStruct.removeEntry(2)
        printEntryData1Struct(entryListStruct)
        
        entryListStruct.addEntry(EntryData1(text: "six", backgroundColor: UIColor.purpleColor(), textColor: UIColor.cyanColor()))
        entryListStruct.addEntry(EntryData1(text: "seven", backgroundColor: UIColor.cyanColor(), textColor: UIColor.magentaColor()))
        printEntryData1Struct(entryListStruct)
        
        entryListStruct.removeEntry(0)
        entryListStruct.removeEntry(3)
        entryListStruct.insertEntry(EntryData1(text: "eight", backgroundColor: UIColor.magentaColor(), textColor: UIColor.blackColor()), atIndex: 3)
        entryListStruct.addEntry(EntryData1(text: "nine", backgroundColor: UIColor.blackColor(), textColor: UIColor.whiteColor()))
        printEntryData1Struct(entryListStruct)
        
        entryListStruct[0]?.printValues()
        entryListStruct[1]?.printValues()
        entryListStruct[2]?.printValues()
        entryListStruct[3]?.printValues()
        println()
    }
    
    private func printEntryData1Struct(entryList: EntryArray<EntryData1>, newLine: Bool = true) {
        for data in entryList {
            if data != nil {
                data!.printValues()
            }
            else {
                println(data)
            }
        }
        
        println("Count: \(entryList.count)")

        if newLine {
            println()
        }
    }
    
    private func testWithAnyList() {
        
        var entryListAny: EntryArray<AnyObject> = EntryArray<AnyObject>(arraySize: kEntryListSize)

        entryListAny.addEntry(1)
        entryListAny.addEntry("one")
        entryListAny.addEntry(UIColor.greenColor())
        entryListAny.addEntry(1.1)

        println(entryListAny[0])
        println(entryListAny[1])
        println(entryListAny[2])
        println(entryListAny[3])
        println()
    }
    
    private func testWithNestedAnyList() {
        
        testWithSampleMonitoredEmployeeCell()
        testWithSampleAlarmCell()
    }
    
    private func testWithSampleMonitoredEmployeeCell() {
        
        var cell: EntryArray< EntryArray<AnyObject>? > = EntryArray<EntryArray<AnyObject>?>(arraySize: 2)
        var nameRow: EntryArray<AnyObject> = EntryArray<AnyObject>(arraySize: 1)
        var stateRow: EntryArray<AnyObject> = EntryArray<AnyObject>(arraySize: 2)
        
        nameRow.addEntry("Julie Andrews")
        
        cell.addEntry(nameRow)
        
        stateRow.addEntry("HOLD")
        stateRow.addEntry("01:23:45")
        
        cell.addEntry(stateRow)
        
        println("Printing example data in a monitored employee cell")
        printCell(cell, showCount: true)
    }
    
    private func testWithSampleAlarmCell() {
        
        var cell: EntryArray< EntryArray<AnyObject>? > = EntryArray<EntryArray<AnyObject>?>(arraySize: 4)
        var emp1Row: EntryArray<AnyObject> = EntryArray<AnyObject>(arraySize: 3)
        var emp2Row: EntryArray<AnyObject> = EntryArray<AnyObject>(arraySize: 3)
        
        emp1Row.addEntry(UIColor.yellowColor())
        emp1Row.addEntry("Amy Smith")
        emp1Row.addEntry("05:46:05")
        
        cell.addEntry(emp1Row)
        
        emp2Row.addEntry(UIColor.redColor())
        emp2Row.addEntry("Goerge Daly")
        emp2Row.addEntry("10:05:02")
        
        cell.addEntry(emp2Row)
        
        println("Printing example data in an alarm cell")
        printCell(cell, showCount: true)
    }
    
    private func printRow(row: EntryArray<AnyObject>?, showCount: Bool = false, newLine: Bool = true) {
        if row != nil {
            if showCount {
                print("\tColumn Count: \(row!.count)\n\t\t")
            }

            for data in row! {
                if data != nil {
                    print("\(data!)\t")
                }
                else {
                    print("\(data)\t")
                }
            }
        }
        else {
            println(row)
        }
        
        if newLine {
            println()
        }
    }
    
    private func printCell(cell: EntryArray< EntryArray<AnyObject>? >?, showCount: Bool = false, newLine: Bool = true) {
        if cell != nil {
            if showCount {
                print("Row Count: \(cell!.count)\n")
            }
            
            for row in cell! {
                printRow(row?, showCount: showCount)
            }
        }
        else {
            println(cell)
        }
        
        if newLine {
            println()
        }
    }
    
}

