// Playground - noun: a place where people can play

import UIKit

func removeFirstNChars(inout shortenedString: String, numChars: Int) {
  
  let charCount: Int = countElements(shortenedString)
  assert(numChars >= 0 && numChars <= charCount, "Can't remove \(numChars) chars from a string of length \(charCount)")
  
  if charCount == 0 || numChars == 0 {
    return
  }
  
  shortenedString = shortenedString.substringFromIndex(advance(shortenedString.startIndex, numChars))
}

func removeFirstChar(inout shortenedString: String) {
  removeFirstNChars(&shortenedString, 1)
}

func removeFirstNChars(inString: String, numChars: Int) -> String {
  
  let charCount: Int = countElements(inString)
  assert(numChars >= 0 && numChars <= charCount, "Can't remove \(numChars) chars from a string of length \(charCount)")
  
  if charCount == 0 || numChars == 0 {
    return ""
  }
  
  return inString.substringFromIndex(advance(inString.startIndex, numChars))
}

func removeFirstChar(inString: String) -> String {
  return removeFirstNChars(inString, 1)
}


let IDs: [String] = ["100","101","102","103","104","105"]

let reducedString = IDs.reduce("", combine: { (combined, next) in combined + "," + next })

println(reducedString)

struct Person {
  var name: String
  var ID: String
}

let people: [Person] = [Person(name: "Thing 1", ID: "01"), Person(name: "Thing 2", ID: "02")]
//let otherPeople: [Person] = [Person(name: "Thing 3", ID: "03")]
let otherPeople: [Person] = []

let combinedIDList01 = people.reduce("", combine: { (combined, next) in
  (combined == "") ? next.ID : combined + "," + next.ID
})
println(combinedIDList01)

var combinedIDList02 = people.reduce("", combine: { (combined, next) in
  combined + "," + next.ID
})

removeFirstNChars(&combinedIDList02, 1)
println(combinedIDList02)

let combinedIDList03 = removeFirstChar(people.reduce("", combine: { (combined, next) in
  combined + "," + next.ID
}))
println(combinedIDList03)

let combinedIDList04: String = {
  if otherPeople.count > 0 {
    return removeFirstChar(otherPeople.reduce("", combine: { (combined, next) in
      combined + "," + next.ID
    }))
  }
  else {
    return ""
  }
}()
println(combinedIDList04)
















