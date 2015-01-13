// Playground - noun: a place where people can play

import UIKit

func printValues(list: [Int], separator: String, newline: Bool = true) {
    
    for value in list {
        
        print(value)
        
        if value != list.last! {
            
            print(separator)
        }
    }
    
    if newline {
        
        println()
    }
}

func printValuesAsTuple(list: [Int], opening: String = "(", closing: String = ")", newline: Bool = true) {
    
    print(opening)
    printValues(list, ",", newline: false)
    print(closing)
    
    if newline {
        
        println()
    }
}

func sum(values: [Int], indices: [Int]) -> Int {
    
    var sum: Int = 0
    
    for index in indices {
        
        assert((index>=0 && index<values.count), "Index \(index) out of bounds")
        sum += values[index]
    }
    
    return sum
}

func printCombinationsForSampleSize(list: [Int], sampleSize: Int) {
    
    var count: Int = list.count
    
    if sampleSize > count {
        
        println("Cannot make any combinations of \(sampleSize) with a list of \(count) values")
        return
    }
    else if sampleSize == 0 {
        
        printValuesAsTuple([Int]())
        return
    }
    
    var indexList: [Int] = [Int]()
    var listSize: Int = 0
    
    while listSize < sampleSize {
        
        indexList.append(listSize)
        listSize++
    }
    
    var lastIndex: Int = listSize-1
    var numCombos: Int = 0

    while indexList[lastIndex] < count {
        
        numCombos++
        printValuesAsTuple(indexList)
        indexList[lastIndex]++
        
        // walk the indexList
        for var i = 1; i < listSize; ++i {
            
            // if any index is past the furthest they should be
            if(indexList[listSize-i] > (count-i)) {
                
                indexList[listSize-(i+1)]++
                
                // increment the previous index and update all
                // the indices after it to be sequential
                for var j = listSize-i; j < listSize; ++j {
                    
                    indexList[j] = indexList[j-1]+1
                }
            }
            else {
                
                break
            }
        }
    }
    
    println("\(numCombos) combinations")
}

func printSumCombinationsForSampleSize(list: [Int], sampleSize: Int, targetSum: Int) {
    
    var count: Int = list.count
    
    if sampleSize > count {
        
        println("Cannot make any combinations of \(sampleSize) with a list of \(count) values")
        return
    }
    else if sampleSize == 0 {
        
        printValuesAsTuple([Int]())
        return
    }
    
    var indexList: [Int] = [Int]()
    var indexListSize: Int = 0
    
    while indexListSize < sampleSize {
        
        indexList.append(indexListSize)
        indexListSize++
    }
    
    var lastIndex: Int = indexListSize-1
    var numCombos: Int = 0
    
    while indexList[lastIndex] < count {
        
        numCombos++
        
        if sum(list, indexList) == targetSum {
            
            printValuesAsTuple(indexList)
        }

        indexList[lastIndex]++
        
        // walk the indexList
        for var i = 1; i < indexListSize; ++i {
            
            // if any index is past the furthest they should be
            if(indexList[indexListSize-i] > (count-i)) {
                
                indexList[indexListSize-(i+1)]++
                
                // increment the previous index and update all
                // the indices after it to be sequential
                for var j = indexListSize-i; j < indexListSize; ++j {
                    
                    indexList[j] = indexList[j-1]+1
                }
            }
            else {
                
                break
            }
        }
    }
}

//func doSomethingWithCombinations(list: [Int], sampleSize: Int, targetSum: Int, completion: ([Int]) -> ()) {
//    
//    var count: Int = list.count
//    
//    if sampleSize > count {
//        
//        println("Cannot make any combinations of \(sampleSize) with a list of \(count) values")
//        return
//    }
//    else if sampleSize == 0 {
//        
//        printValuesAsTuple([Int]())
//        return
//    }
//    
//    var indexList: [Int] = [Int]()
//    var listSize: Int = 0
//    
//    while listSize < sampleSize {
//        
//        indexList.append(listSize)
//        listSize++
//    }
//    
//    var lastIndex: Int = listSize-1
//    var numCombos: Int = 0
//    
//    while indexList[lastIndex] < count {
//        
//        numCombos++
////        printValuesAsTuple(indexList)
//        completion(indexList)
//        
//        indexList[lastIndex]++
//        
//        // walk the indexList
//        for var i = 1; i < listSize; ++i {
//            
//            // if any index is past the furthest they should be
//            if(indexList[listSize-i] > (count-i)) {
//                
//                indexList[listSize-(i+1)]++
//                
//                // increment the previous index and update all
//                // the indices after it to be sequential
//                for var j = listSize-i; j < listSize; ++j {
//                    
//                    indexList[j] = indexList[j-1]+1
//                }
//            }
//            else {
//                
//                break
//            }
//        }
//    }
//    
//    println("\(numCombos) combinations")
//}

func PrintSumCombinations(numbers: [Int], n: Int) {

    for i in 1...numbers.count {

        printSumCombinationsForSampleSize(numbers, i, n)
    }
}

var numbers: [Int] = [1,1,2,2,4]
var otherNumbers: [Int] = [1,1,2,-2,4]
println(numbers)
printValues(numbers, " ")
printValuesAsTuple(numbers, opening: "[", closing: "]")
println()

PrintSumCombinations(numbers, 4)
//PrintSumCombinations(otherNumbers, 5)

//for i in 0...6 {
//
//    println("Printing all combinations using \(i) values")
//    printSumCombinationsForSampleSize(numbers, i, 4)
//    println()
//}

//println(sum(numbers, [0,1,2]))
//println(sum(numbers, [0,1,3]))
//println(sum(numbers, [2,3]))
//println(sum(numbers, [4]))
//println(sum(numbers, [0,1,2,3,4]))

//doSomethingWithCombinations(numbers, 1, 4, {(combination: [Int]) in
//    
//        printValuesAsTuple(combination)
//    })













