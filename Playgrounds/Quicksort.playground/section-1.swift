// Playground - noun: a place where people can play

import UIKit
import Foundation

// http://stackoverflow.com/questions/24101718/swift-performance-sorting-arrays
func quicksort_swift<T : Comparable>(inout a: [T], start: Int, end: Int) {
  if (end - start < 2){
    return
  }
  var p = a[start + (end - start)/2]
  var l = start
  var r = end - 1
  while (l <= r){
    if (a[l] < p){
      l += 1
      continue
    }
    if (a[r] > p){
      r -= 1
      continue
    }
    var t = a[l]
    a[l] = a[r]
    a[r] = t
    l += 1
    r -= 1
  }
  quicksort_swift(&a, start, r + 1)
  quicksort_swift(&a, r + 1, end)
}

var intArray: [Int] = [0, 5, 2, 8, 1234, -1, 2]
quicksort_swift(&intArray, 0, intArray.count)

var stringArray: [String] = ["A", "few", "words", "here", "and", "there", "."]
quicksort_swift(&stringArray, 0, stringArray.count)


func ==(lhs: FullName, rhs: FullName) -> Bool {
  return lhs.firstName == rhs.firstName && lhs.lastName == rhs.lastName
}

func <(lhs: FullName, rhs: FullName) -> Bool {
  if lhs.lastName < rhs.lastName {
    return true
  }
  else if lhs.lastName > rhs.lastName {
    return false
  }
  else {
    return lhs.firstName < rhs.firstName
  }
}

//func <(lhs: FullName, rhs: FullName) -> Bool {
//  return (lhs.firstName + lhs.lastName) < (rhs.firstName + rhs.lastName)
//}

class FullName: Comparable {
  
  var firstName: String = ""
  var lastName: String = ""
  
  init(firstName: String, lastName: String) {
    self.firstName = firstName
    self.lastName = lastName
  }
  
}

var namesArray1: [FullName] = [
  FullName(firstName: "Tiger", lastName: "Woods")
  , FullName(firstName: "Joe", lastName: "Montana")
  , FullName(firstName: "Gordie", lastName: "Howe")
  , FullName(firstName: "Michael", lastName: "Jordan")
  , FullName(firstName: "Michael", lastName: "Jackson")
]
quicksort_swift(&namesArray1, 0, namesArray1.count)


func quicksort_swift_function<T : Comparable>(inout a: [T], start: Int, end: Int, isOrderedBefore: (T, T) -> Bool) {
  if (end - start < 2){
    return
  }
  var p = a[start + (end - start)/2]
  var l = start
  var r = end - 1
  while (l <= r){
//    if (a[l] < p){
    if isOrderedBefore(a[l],p){
      l += 1
      continue
    }
//    if (a[r] > p){
    if isOrderedBefore(p,a[r]){
      r -= 1
      continue
    }
    var t = a[l]
    a[l] = a[r]
    a[r] = t
    l += 1
    r -= 1
  }
  quicksort_swift_function(&a, start, r + 1, isOrderedBefore)
  quicksort_swift_function(&a, r + 1, end, isOrderedBefore)
}

func sortNameByLastFirst(lhs: FullName, rhs: FullName) -> Bool {
  if lhs.lastName < rhs.lastName {
    return true
  }
  else if lhs.lastName > rhs.lastName {
    return false
  }
  else {
    return lhs.firstName < rhs.firstName
  }
}

var namesArray2: [FullName] = [
  FullName(firstName: "Tiger", lastName: "Woods")
  , FullName(firstName: "Joe", lastName: "Montana")
  , FullName(firstName: "Gordie", lastName: "Howe")
  , FullName(firstName: "Michael", lastName: "Jordan")
  , FullName(firstName: "Michael", lastName: "Jackson")
]
quicksort_swift_function(&namesArray2, 0, namesArray2.count, <)
//quicksort_swift_function(&namesArray2, 0, namesArray2.count, sortNameByLastFirst)


func sortNameByFullName(lhs: FullName, rhs: FullName) -> Bool {
  return (lhs.firstName + lhs.lastName) < (rhs.firstName + rhs.lastName)
}

var namesArray3: [FullName] = [
  FullName(firstName: "Tiger", lastName: "Woods")
  , FullName(firstName: "Joe", lastName: "Montana")
  , FullName(firstName: "Gordie", lastName: "Howe")
  , FullName(firstName: "Michael", lastName: "Jordan")
  , FullName(firstName: "Michael", lastName: "Jackson")
]
quicksort_swift_function(&namesArray3, 0, namesArray3.count, sortNameByFullName)









