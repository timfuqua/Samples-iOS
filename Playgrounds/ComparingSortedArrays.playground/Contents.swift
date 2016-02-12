//: Playground - noun: a place where people can play

import UIKit

func <<T where T: Comparable>(lhs: [T], rhs: [T]) -> Bool {
  if lhs.count < rhs.count {
    return true
  }
  else if lhs.count > rhs.count {
    return false
  }
  
  return !zip(lhs, rhs).contains { $0 > $1 }
}

let first = [9, 8, 7, 6, 4]
let second = [9, 8, 7, 6, 5]
let third = [8, 7, 6, 5, 4]
let fourth = [9, 8, 7, 6]

let firstSecondComp: Bool = first < second
let secondFirstComp: Bool = second < first
let secondThirdComp: Bool = second < third
let thirdSecondComp: Bool = third < second
let firstThirdComp: Bool = first < third
let thirdFirstComp: Bool = third < first

let fourthFirstComp: Bool = fourth < first
let fourthSecondComp: Bool = fourth < second
let fourthThirdComp: Bool = fourth < third
let firstFourthComp: Bool = first < fourth
let secondFourthComp: Bool = second < fourth
let thirdFourthComp: Bool = third < fourth

let oneTwo = [1, 2]
let oneTwoThree = [1, 2, 3]

oneTwo < oneTwoThree
oneTwoThree < oneTwo