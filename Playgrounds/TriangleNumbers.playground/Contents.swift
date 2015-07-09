// Given a set of 3 numbers chosen randomly between a and b, how many
// different left-to-right orderings of the 3 numbers can you make?

// IE: if a=0 and b=0, you can make exactly one ordering {0,0,0}

// IE: if a=0 and b=1, you can do the following:
//    let x:=the first number
//    let y:=the second number
//    let z:=the third number
//    
//    The 8 possible permutations of x, y, and z ({x,y,z}) are binary patterns:
//      {0,0,0}, {0,0,1}, {0,1,0}, {0,1,1}, {1,0,0}, {1,0,1}, {1,1,0}, {1,1,1}
//
//    We also want to strip out any permutations where {x,y,z} = {y,z,x} = {z,x,y}
//
//    We can ignore any case where x=y=z. Starting at the beginning, skip {0,0,0},
//    and generate the 2 shifted cases of {0,0,1} ({1,0,0} and {0,1,0}) and
//    strip them out of the set:
//      {0,0,0}, {0,0,1}, {0,1,1}, {1,0,1}, {1,1,0}, {1,1,1}
//
//    Next go to {0,1,1} and generate the shifted case(s) ({1,0,1} and {1,1,0})
//    and strip them out of the set:
//      {0,0,0}, {0,0,1}, {0,1,1}, {1,1,1}
//
//    We are left with just 4 permutations

// IE: if a=1 and b=3, you can do the following
//    let x:=the first number
//    let y:=the second number
//    let z:=the third number
//
//    The 27 possible permutations of x, y, and z ({x,y,z}) are:
//      {1,1,1}, {1,1,2}, {1,1,3}, {1,2,1}, {1,2,2}, {1,2,3}, {1,3,1}, {1,3,2}, {1,3,3}, {2,1,1}, {2,1,2}, {2,1,3}, {2,2,1}, {2,2,2}, {2,2,3}, {2,3,1}, {2,3,2}, {2,3,3}, {3,1,1}, {3,1,2}, {3,1,3}, {3,2,1}, {3,2,2}, {3,2,3}, {3,3,1}, {3,3,2}, {3,3,3}
//
//    We then strip out any permutations where {x,y,z} = {y,z,x} = {z,x,y}
//
//    We can ignore any case where x=y=z. Starting at the beginning:
//
//    Skip {1,1,1}.
//
//    Generate the 2 shifted cases of {1,1,2} ({2,1,1} and {1,2,1}) and
//    strip them out of the set:
//      {1,1,1}, {1,1,2}, {1,1,3}, {1,2,2}, {1,2,3}, {1,3,1}, {1,3,2}, {1,3,3}, {2,1,2}, {2,1,3}, {2,2,1}, {2,2,2}, {2,2,3}, {2,3,1}, {2,3,2}, {2,3,3}, {3,1,1}, {3,1,2}, {3,1,3}, {3,2,1}, {3,2,2}, {3,2,3}, {3,3,1}, {3,3,2}, {3,3,3}
//
//    Continue with {1,1,3} ({3,1,1} and {1,3,1}):
//      {1,1,1}, {1,1,2}, {1,1,3}, {1,2,2}, {1,2,3}, {1,3,2}, {1,3,3}, {2,1,2}, {2,1,3}, {2,2,1}, {2,2,2}, {2,2,3}, {2,3,1}, {2,3,2}, {2,3,3}, {3,1,2}, {3,1,3}, {3,2,1}, {3,2,2}, {3,2,3}, {3,3,1}, {3,3,2}, {3,3,3}
//
//    Continue with {1,2,2} ({2,1,2} and {2,2,1}):
//      {1,1,1}, {1,1,2}, {1,1,3}, {1,2,2}, {1,2,3}, {1,3,2}, {1,3,3}, {2,1,3}, {2,2,2}, {2,2,3}, {2,3,1}, {2,3,2}, {2,3,3}, {3,1,2}, {3,1,3}, {3,2,1}, {3,2,2}, {3,2,3}, {3,3,1}, {3,3,2}, {3,3,3}
//
//    Continue with {1,2,3} ({3,1,2} and {2,3,1}):
//      {1,1,1}, {1,1,2}, {1,1,3}, {1,2,2}, {1,2,3}, {1,3,2}, {1,3,3}, {2,1,3}, {2,2,2}, {2,2,3}, {2,3,2}, {2,3,3}, {3,1,3}, {3,2,1}, {3,2,2}, {3,2,3}, {3,3,1}, {3,3,2}, {3,3,3}
//
//    Continue with {1,3,2} ({2,1,3} and {3,2,1}):
//      {1,1,1}, {1,1,2}, {1,1,3}, {1,2,2}, {1,2,3}, {1,3,2}, {1,3,3}, {2,2,2}, {2,2,3}, {2,3,2}, {2,3,3}, {3,1,3}, {3,2,2}, {3,2,3}, {3,3,1}, {3,3,2}, {3,3,3}
//
//    Continue with {1,3,3} ({3,1,3} and {3,3,1}):
//      {1,1,1}, {1,1,2}, {1,1,3}, {1,2,2}, {1,2,3}, {1,3,2}, {1,3,3}, {2,2,2}, {2,2,3}, {2,3,2}, {2,3,3}, {3,2,2}, {3,2,3}, {3,3,2}, {3,3,3}
//
//    Continue with {1,3,3} ({3,1,3} and {3,3,1}):
//      {1,1,1}, {1,1,2}, {1,1,3}, {1,2,2}, {1,2,3}, {1,3,2}, {1,3,3}, {2,2,2}, {2,2,3}, {2,3,2}, {2,3,3}, {3,2,2}, {3,2,3}, {3,3,2}, {3,3,3}
//
//    Skip {2,2,2}.
//
//    Continue with {2,2,3} ({3,2,2} and {2,3,2}):
//      {1,1,1}, {1,1,2}, {1,1,3}, {1,2,2}, {1,2,3}, {1,3,2}, {1,3,3}, {2,2,2}, {2,2,3}, {2,3,3}, {3,2,3}, {3,3,2}, {3,3,3}
//
//    Continue with {2,3,3} ({3,2,3} and {3,3,2}):
//      {1,1,1}, {1,1,2}, {1,1,3}, {1,2,2}, {1,2,3}, {1,3,2}, {1,3,3}, {2,2,2}, {2,2,3}, {2,3,3}, {3,3,3}
//
//    Skip {3,3,3}.
//

// A better algorithm would be to check if the permutation about to be added is
// a shift variant of an existing item in the list or not. Only add the new
// permutation if a shift variant doesn't exist.

// Another thought is that if there is a mathematical formula for determining
// the positions of the shift variants in the unfiltered generated list, then
// trimming the final list would be trivial and there would be no need to
// perform any such logic when generating the permutations to see if they were
// shift variants of existing permutations already in the list.

// When a=0, b=1, that means there are 2 possible values. We are choosing them
// for x,y,z, which is 3 values. 2^3 = 8 possible permutations
//
// When a=1, b=3, that means there are 3 possible values. We are choosing them
// for x,y,z, which is 3 values. 3^3 = 27 possible permutations



import UIKit
import Foundation

func removeFirstNChars(inString: String, numChars: Int) -> String {
  let charCount: Int = count(inString)
  
  if charCount == 0 || numChars == 0 {
    return ""
  }
  
  assert(numChars <= charCount, "Can't remove \(numChars) chars from a string of length \(charCount)")
  
  return inString.substringFromIndex(advance(inString.startIndex, numChars))
}

func reduceWithDelimiter(stringArray: [String], delimiter: String) -> String {
  return removeFirstNChars(stringArray.reduce("", combine: { (combined, next) in
    combined + delimiter + next
  }), count(delimiter))
}

// treat the values in a Permutation like the digits in a number system where
// each digit is an element of [a,b]. For example, a 3 digit number can range
// from {a,a,a} to {b,b,b}. The second lowest number is {a,a,a+1} and the
// second largest number is {b,b,b-1}. This is equivalent to the decimal numbers
// of 001 and 998, where a=0 and b=9. When incrementing the permutation, add one
// to the value at the last index. If it's value would go over the upper bound,
// add 1 to the previous index and repeat the check until the digit doesn't go
// above the upper bound. If the value at index 0 would go over the upper bound,
// then you've found the 2's compliment of this number system and have "rolled
// over" to the lowest number.
postfix func ++(inout permutation: Permutation) -> Permutation {
  let extraDebugging: Bool = false
  if extraDebugging { println("Starting postfix++: \(permutation.toString())") }
  var originalPermutation = permutation
  
  if extraDebugging { println(permutation.values.count-1) }
  for var i = permutation.values.count-1; i >= 0; i-- {
    if extraDebugging { println("Starting loop at i=\(i)") }
    let newVal = permutation.values[i]+1
    if extraDebugging { println("newVal will be: \(newVal)") }
    if newVal > permutation.settings.upperBound {
      if extraDebugging { println("newVal > permutation.upperBound: \(newVal) > \(permutation.settings.upperBound)") }
      permutation.values[i] = permutation.settings.lowerBound
    }
    else {
      if extraDebugging { println("newVal <= permutation.upperBound: \(newVal) <= \(permutation.settings.upperBound)") }
      permutation.values[i] = newVal
      break
    }
  }
  
  if extraDebugging { println("Returning postfix++: \(originalPermutation.toString())") }
  return originalPermutation
}

struct PermutationSettings {
  var lowerBound: Int
  var upperBound: Int
  var numValues: Int
  
  init(lowerBound: Int, upperBound: Int, numValues: Int) {
    self.lowerBound = lowerBound
    self.upperBound = upperBound
    self.numValues = numValues
  }
}

struct Permutation {
  var settings: PermutationSettings
  var values: [Int] = []
  
  init(settings: PermutationSettings, values: [Int]? = nil) {
    self.settings = settings
    if values != nil {
      if values!.count == settings.numValues {
        self.values = values!
      }
      else {
        println("The number of values provided doesn't match the expected number of values defined in the settings.")
      }
    }
  }
  
  func toString() -> String {
    var description: String = ""
    
    if values.count > 0 {
      description += "{" + reduceWithDelimiter(values.map({ "\($0)" }), ",") + "}"
    }
    
    return description
  }
  
  func isShiftInvariant() -> Int? {
    if values.count > 0 {
      if values.count == 1 {
        return values[0]
      }
      
      let invariantValue = values[0]
      for i in 1..<values.count {
        if values[i] != invariantValue {
          return nil
        }
      }
      
      return invariantValue
    }
    
    return nil
  }
}

func createLowestPermutation(settings: PermutationSettings) -> Permutation {
  var lowestPerm: Permutation = Permutation(settings: settings)
  
  for i in 0..<lowestPerm.settings.numValues {
    lowestPerm.values.append(lowestPerm.settings.lowerBound)
  }
  
  return lowestPerm
}

func createHighestPermutation(settings: PermutationSettings) -> Permutation {
  var highestPerm: Permutation = Permutation(settings: settings)
  
  for i in 0..<highestPerm.settings.numValues {
    highestPerm.values.append(highestPerm.settings.upperBound)
  }
  
  return highestPerm
}

func test01() {
  println("Create a 3 digit permutation and display it's value")
  var aPerm = Permutation(settings: PermutationSettings(lowerBound: 1, upperBound: 3, numValues: 3), values: [1,2,3])
  
  println(aPerm.toString())
}

func generateAllPermutations(settings: PermutationSettings) -> [Permutation] {
  var allPerms: [Permutation] = []
  let firstPerm = createLowestPermutation(settings)
  let lastPerm = createHighestPermutation(settings)
  var incrementingPerm = firstPerm

  while incrementingPerm.toString() != lastPerm.toString() {
    allPerms.append(incrementingPerm++)
  }
  allPerms.append(lastPerm)
  
  return allPerms
}

func test02() {
  println("Create a 3 digit permutation and perform some increment operations")
  var aPerm = Permutation(settings: PermutationSettings(lowerBound: 0, upperBound: 1, numValues: 3), values: [0,0,0])
  
  println("should be {0,0,0}")
  println(aPerm.toString())
  
  println("should be {0,0,1}")
  aPerm++
  println(aPerm.toString())
  
  println("should print out {0,0,1} first, but will be {0,1,0} after line executes")
  println(aPerm++.toString())
  println(aPerm.toString())
}

func test03() {
  println("Determine all the 3 digit permutations of [0,1]")
  var allPerms: [Permutation] = generateAllPermutations(PermutationSettings(lowerBound: 0, upperBound: 1, numValues: 3))
  
  println("Total number of permutations: \(allPerms.count)")
  println(reduceWithDelimiter(allPerms.map({ $0.toString() }), ", "))
}

func test04() {
  println("Determine all the 3 digit permutations of [1,3]")
  var allPerms: [Permutation] = generateAllPermutations(PermutationSettings(lowerBound: 1, upperBound: 3, numValues: 3))
  
  println("Total number of permutations: \(allPerms.count)")
  println(reduceWithDelimiter(allPerms.map({ $0.toString() }), ", "))
}

func test05() {
  println("Determine all the 3 digit permutations of [1,4]")
  var allPerms: [Permutation] = generateAllPermutations(PermutationSettings(lowerBound: 1, upperBound: 4, numValues: 3))
  
  println("Total number of permutations: \(allPerms.count)")
  println(reduceWithDelimiter(allPerms.map({ $0.toString() }), ", "))
}

// takes in a list of permutations that presumably was generated using the
// generateAllPermutations function, and returns an array of indices of where
// the shift invariant permutations are. Shift invariant permutations are of the
// form {x,x,x,...,x}, where every value in the tuple is the same.
func getShiftInvariantIndices(fromPermList: [Permutation]) -> [Int] {
  // if the supplied list has no permutations, return an empty set
  if fromPermList.count == 0 {
    return []
  }
  
  // if the supplied list has exactly one permutation, which would be the case
  // if the list was generated with lowerBound = upperBound, then the only entry
  // is a shift invariant permutation
  if fromPermList.count == 1 {
    return [0]
  }
  
  // starting at the lower bound of the permutation, go through each permutation
  // until you find one that is shift invariant and it's value *should* match
  // the currentValue, then increment the current value and continue searching
  // for the next shift invariant permutation.
  // The first permutation should be shift invariant with a value of lowerBound
  // and the last permutation should be shift invariant with a value of
  // upperBound, but that can be done only as an assurance test.
  var currentValue: Int = fromPermList[0].settings.lowerBound
  var shiftInvariantIndices: [Int] = []
  
  for i in 0..<fromPermList.count {
    if let shiftInvariantValue = fromPermList[i].isShiftInvariant() {
      assert(shiftInvariantValue == currentValue, "Found a shift invariant, but it's value was expected to be \(currentValue) and is instead \(shiftInvariantValue).")
      currentValue++
      shiftInvariantIndices.append(i)
    }
  }
  
  return shiftInvariantIndices
}

func test06() {
  println("Determine all the 3 digit permutations of [1,4], and determine the indices of the shift invariant permutations")
  var allPerms: [Permutation] = generateAllPermutations(PermutationSettings(lowerBound: 1, upperBound: 4, numValues: 3))
  
  println("Total number of permutations: \(allPerms.count)")
  println(reduceWithDelimiter(allPerms.map({ $0.toString() }), ", "))

  var shiftInvariantIndices = getShiftInvariantIndices(allPerms)
  println("Total number of shift invariant permutations: \(shiftInvariantIndices.count)")
  for i in 0..<shiftInvariantIndices.count {
    println("At index \(shiftInvariantIndices[i]): " + allPerms[shiftInvariantIndices[i]].toString())
  }
  
  println()
}

func testFindShiftInvariance(lowerBound: Int, upperBound: Int, numValues: Int) {
  println("Determine all the \(numValues) digit permutations of [\(lowerBound),\(upperBound)], and determine the indices of the shift invariant permutations")
  var allPerms: [Permutation] = generateAllPermutations(PermutationSettings(lowerBound: lowerBound, upperBound: upperBound, numValues: numValues))
  
  println("Total number of permutations: \(allPerms.count)")
  println(reduceWithDelimiter(allPerms.map({ $0.toString() }), ", "))
  
  var shiftInvariantIndices = getShiftInvariantIndices(allPerms)
  println("Total number of shift invariant permutations: \(shiftInvariantIndices.count)")
  for i in 0..<shiftInvariantIndices.count {
    println("At index \(shiftInvariantIndices[i]): " + allPerms[shiftInvariantIndices[i]].toString())
  }
  
  println()
}

func test07() {
  var lowerBound: Int = 1
  var highestUpperBound: Int = 6
  var numDigits: Int = 3
  
  for i in lowerBound...highestUpperBound {
    testFindShiftInvariance(lowerBound, i, 3)
  }
}

//test01()
//test02()
//test03()
//test04()
//test05()
//test06()
//test07()









