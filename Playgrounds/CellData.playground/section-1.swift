import UIKit

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

func runTests(silent: Bool = false) -> Bool {
    var testsSucceeded: Int = 0
    var testsFailed: Int = 0
    
    var result: Bool = false
    
    if !silent {
        println("**** RUNNING TESTS ****")
    }
    
    if !silent {
        print("Running testRemoveBelowRange(): ")
    }
    result = testRemoveBelowRange()
    result ? testsSucceeded++ : testsFailed++
    if !silent {
        result ? println("PASS") : println("FAIL")
    }

    if !silent {
        print("Running testRemoveAboveRange(): ")
    }
    result = testRemoveAboveRange()
    result ? testsSucceeded++ : testsFailed++
    if !silent {
        result ? println("PASS") : println("FAIL")
    }

    if !silent {
        print("Running testRemoveFirst(): ")
    }
    result = testRemoveFirst()
    result ? testsSucceeded++ : testsFailed++
    if !silent {
        result ? println("PASS") : println("FAIL")
    }

    if !silent {
        print("Running testRemoveLast(): ")
    }
    result = testRemoveLast()
    result ? testsSucceeded++ : testsFailed++
    if !silent {
        result ? println("PASS") : println("FAIL")
    }
    
    if !silent {
        println("**** TESTS FINISHED ****")
        println("SUCCEEDED: \(testsSucceeded)")
        println("FAILED: \(testsFailed)")
    }
    
    return testsFailed == 0
}

func testRemoveBelowRange() -> Bool {
    var data: CellData = CellData()
    return data.removeEntry(-1) == false
}

func testRemoveAboveRange() -> Bool {
    var data: CellData = CellData()
    return data.removeEntry(4) == false
}

func testRemoveFirst() -> Bool {
    var data: CellData = CellData()
    
    var removeShouldReturnTrue = data.removeEntry(0)
    var firstLeftShouldBeNil = (data.left[0] == nil)
    var firstRightShouldBeNil = (data.right[0] == nil)
    
    return removeShouldReturnTrue && firstLeftShouldBeNil && firstRightShouldBeNil
}

func testRemoveLast() -> Bool {
    var data: CellData = CellData()
    
    var removeShouldReturnTrue = data.removeEntry(data.kMaxEntriesAllowed-1)
    var lastLeftShouldBeNil = (data.left[data.kMaxEntriesAllowed-1] == nil)
    var lastRightShouldBeNil = (data.right[data.kMaxEntriesAllowed-1] == nil)
    
    return removeShouldReturnTrue && lastLeftShouldBeNil && lastRightShouldBeNil
}

runTests()
println()


var firstData: CellData = CellData(name: "First")
firstData.printCellDataUnwrapped()

firstData.addEntry("First_Left_1", right: "First_Right_1")
firstData.addEntry("First_Left_2", right: "First_Right_2")
firstData.addEntry("First_Left_3", right: "First_Right_3")
firstData.printCellDataUnwrapped()

firstData.removeEntry(1)
firstData.addEntry("First_Left_4", right: "First_Right_4")
firstData.addEntry("First_Left_5", right: "First_Right_5")
firstData.printCellDataUnwrapped()

firstData.insertEntry("First_Left_6", right: "First_Right_6", atIndex: 0)
firstData.printCellDataUnwrapped()

firstData.addEntry("First_Left_Full", right: "First_Right_Full")

var entry1: (String?, String?) = firstData.getEntry(0)
println(entry1)
println("\(entry1.0!)\t\t\(entry1.1!)")

var entry2: (String?, String?) = firstData.getEntry(-1)

firstData.removeEntry(0)
var entry3: (String?, String?) = firstData.getEntry(0)















