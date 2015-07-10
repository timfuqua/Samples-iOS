// Given a set of 3 numbers chosen randomly between a and b, how many
// different left-to-right orderings of the 3 numbers can you make?

// IE: if a=0 and b=0, you can make exactly one ordering {0,0,0}

// IE: if a=0 and b=1, you can do the following:
//    let x:=the first number
//    let y:=the second number
//    let z:=the third number
//    
//    The 8 possible combinations of x, y, and z ({x,y,z}) are binary patterns:
//      {0,0,0}, {0,0,1}, {0,1,0}, {0,1,1}, {1,0,0}, {1,0,1}, {1,1,0}, {1,1,1}
//
//    We also want to strip out any combinations where {x,y,z} = {y,z,x} = {z,x,y}
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
//    We are left with just 4 combinations

// IE: if a=1 and b=3, you can do the following
//    let x:=the first number
//    let y:=the second number
//    let z:=the third number
//
//    The 27 possible combinations of x, y, and z ({x,y,z}) are:
//      {1,1,1}, {1,1,2}, {1,1,3}, {1,2,1}, {1,2,2}, {1,2,3}, {1,3,1}, {1,3,2}, {1,3,3}, {2,1,1}, {2,1,2}, {2,1,3}, {2,2,1}, {2,2,2}, {2,2,3}, {2,3,1}, {2,3,2}, {2,3,3}, {3,1,1}, {3,1,2}, {3,1,3}, {3,2,1}, {3,2,2}, {3,2,3}, {3,3,1}, {3,3,2}, {3,3,3}
//
//    We then strip out any combinations where {x,y,z} = {y,z,x} = {z,x,y}
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

// A better algorithm would be to check if the combination about to be added is
// a shift variant of an existing item in the list or not. Only add the new
// combination if a shift variant doesn't exist.

// Another thought is that if there is a mathematical formula for determining
// the positions of the shift variants in the unfiltered generated list, then
// trimming the final list would be trivial and there would be no need to
// perform any such logic when generating the combinations to see if they were
// shift variants of existing combinations already in the list.

// When a=0, b=1, that means there are 2 possible values. We are choosing them
// for x,y,z, which is 3 values. 2^3 = 8 possible combinations
//
// When a=1, b=3, that means there are 3 possible values. We are choosing them
// for x,y,z, which is 3 values. 3^3 = 27 possible combinations



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

// treat the values in a Combination like the digits in a number system where
// each digit is an element of [a,b]. For example, a 3 digit number can range
// from {a,a,a} to {b,b,b}. The second lowest number is {a,a,a+1} and the
// second largest number is {b,b,b-1}. This is equivalent to the decimal numbers
// of 001 and 998, where a=0 and b=9. When incrementing the combination, add one
// to the value at the last index. If it's value would go over the upper bound,
// add 1 to the previous index and repeat the check until the digit doesn't go
// above the upper bound. If the value at index 0 would go over the upper bound,
// then you've found the 2's compliment of this number system and have "rolled
// over" to the lowest number.
postfix func ++(inout combination: Combination) -> Combination {
  let extraDebugging: Bool = false
  if extraDebugging { println("Starting postfix++: \(combination.toString())") }
  var originalCombination = combination
  
  if extraDebugging { println(combination.values.count-1) }
  for var i = combination.values.count-1; i >= 0; i-- {
    if extraDebugging { println("Starting loop at i=\(i)") }
    let newVal = combination.values[i]+1
    if extraDebugging { println("newVal will be: \(newVal)") }
    if newVal > combination.settings.upperBound {
      if extraDebugging { println("newVal > combination.upperBound: \(newVal) > \(combination.settings.upperBound)") }
      combination.values[i] = combination.settings.lowerBound
    }
    else {
      if extraDebugging { println("newVal <= combination.upperBound: \(newVal) <= \(combination.settings.upperBound)") }
      combination.values[i] = newVal
      break
    }
  }
  
  if extraDebugging { println("Returning postfix++: \(originalCombination.toString())") }
  return originalCombination
}

struct CombinationSettings {
  var lowerBound: Int
  var upperBound: Int
  var numValues: Int
  
  init(lowerBound: Int, upperBound: Int, numValues: Int) {
    self.lowerBound = lowerBound
    self.upperBound = upperBound
    self.numValues = numValues
  }
}

struct Combination {
  var settings: CombinationSettings
  var values: [Int] = []
  
  init(settings: CombinationSettings, values: [Int]? = nil) {
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

func createLowestCombination(settings: CombinationSettings) -> Combination {
  var lowestPerm: Combination = Combination(settings: settings)
  
  for i in 0..<lowestPerm.settings.numValues {
    lowestPerm.values.append(lowestPerm.settings.lowerBound)
  }
  
  return lowestPerm
}

func createHighestCombination(settings: CombinationSettings) -> Combination {
  var highestPerm: Combination = Combination(settings: settings)
  
  for i in 0..<highestPerm.settings.numValues {
    highestPerm.values.append(highestPerm.settings.upperBound)
  }
  
  return highestPerm
}

func test01() {
  println("Create a 3 digit combination and display it's value")
  var aPerm = Combination(settings: CombinationSettings(lowerBound: 1, upperBound: 3, numValues: 3), values: [1,2,3])
  
  println(aPerm.toString())
}

func generateAllCombinations(settings: CombinationSettings) -> [Combination] {
  var allPerms: [Combination] = []
  let firstPerm = createLowestCombination(settings)
  let lastPerm = createHighestCombination(settings)
  var incrementingPerm = firstPerm

  while incrementingPerm.toString() != lastPerm.toString() {
    allPerms.append(incrementingPerm++)
  }
  allPerms.append(lastPerm)
  
  return allPerms
}

func test02() {
  println("Create a 3 digit combination and perform some increment operations")
  var aPerm = Combination(settings: CombinationSettings(lowerBound: 0, upperBound: 1, numValues: 3), values: [0,0,0])
  
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
  println("Determine all the 3 digit combinations of [0,1]")
  var allPerms: [Combination] = generateAllCombinations(CombinationSettings(lowerBound: 0, upperBound: 1, numValues: 3))
  
  println("Total number of combinations: \(allPerms.count)")
  println(reduceWithDelimiter(allPerms.map({ $0.toString() }), ", "))
}

func test04() {
  println("Determine all the 3 digit combinations of [1,3]")
  var allPerms: [Combination] = generateAllCombinations(CombinationSettings(lowerBound: 1, upperBound: 3, numValues: 3))
  
  println("Total number of combinations: \(allPerms.count)")
  println(reduceWithDelimiter(allPerms.map({ $0.toString() }), ", "))
}

func test05() {
  println("Determine all the 3 digit combinations of [1,4]")
  var allPerms: [Combination] = generateAllCombinations(CombinationSettings(lowerBound: 1, upperBound: 4, numValues: 3))
  
  println("Total number of combinations: \(allPerms.count)")
  println(reduceWithDelimiter(allPerms.map({ $0.toString() }), ", "))
}

// takes in a list of combinations that presumably was generated using the
// generateAllCombinations function, and returns an array of indices of where
// the shift invariant combinations are. Shift invariant combinations are of the
// form {x,x,x,...,x}, where every value in the tuple is the same.
func getShiftInvariantIndices(fromPermList: [Combination]) -> [Int] {
  // if the supplied list has no combinations, return an empty set
  if fromPermList.count == 0 {
    return []
  }
  
  // if the supplied list has exactly one combination, which would be the case
  // if the list was generated with lowerBound = upperBound, then the only entry
  // is a shift invariant combination
  if fromPermList.count == 1 {
    return [0]
  }
  
  // starting at the lower bound of the combination, go through each combination
  // until you find one that is shift invariant and it's value *should* match
  // the currentValue, then increment the current value and continue searching
  // for the next shift invariant combination.
  // The first combination should be shift invariant with a value of lowerBound
  // and the last combination should be shift invariant with a value of
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
  println("Determine all the 3 digit combinations of [1,4], and determine the indices of the shift invariant combinations")
  var allPerms: [Combination] = generateAllCombinations(CombinationSettings(lowerBound: 1, upperBound: 4, numValues: 3))
  
  println("Total number of combinations: \(allPerms.count)")
  println(reduceWithDelimiter(allPerms.map({ $0.toString() }), ", "))

  var shiftInvariantIndices = getShiftInvariantIndices(allPerms)
  println("Total number of shift invariant combinations: \(shiftInvariantIndices.count)")
  for i in 0..<shiftInvariantIndices.count {
    println("At index \(shiftInvariantIndices[i]): " + allPerms[shiftInvariantIndices[i]].toString())
  }
  
  println()
}

func testFindShiftInvariance(lowerBound: Int, upperBound: Int, numValues: Int) {
  println("Determine all the \(numValues) digit combinations of [\(lowerBound),\(upperBound)], and determine the indices of the shift invariant combinations")
  var allPerms: [Combination] = generateAllCombinations(CombinationSettings(lowerBound: lowerBound, upperBound: upperBound, numValues: numValues))
  
  println("Total number of combinations: \(allPerms.count)")
  println(reduceWithDelimiter(allPerms.map({ $0.toString() }), ", "))
  
  var shiftInvariantIndices = getShiftInvariantIndices(allPerms)
  println("Total number of shift invariant combinations: \(shiftInvariantIndices.count)")
  for i in 0..<shiftInvariantIndices.count {
    println("At index \(shiftInvariantIndices[i]): " + allPerms[shiftInvariantIndices[i]].toString())
  }
  
  println()
}

func test07() {
  var lowerBound: Int = 1
  var highestUpperBound: Int = 3
//  var highestUpperBound: Int = 6
  var numDigits: Int = 3
  
  for i in lowerBound...highestUpperBound {
    testFindShiftInvariance(lowerBound, i, 3)
  }
}

//func removeShiftVariants(fromPermList: [Combination]) -> [Combination] {
//  
//}

//test01()
//test02()
//test03()
//test04()
//test05()
//test06()
//test07()









