// Playground - noun: a place where people can play

import UIKit

var fullName = "Berry, Chuck"
var first: String = ""
var last: String = ""

func extractFirstLastName(inout first: String, inout last: String, lastCommaFirst: String) -> Bool {

  var components: [String] = lastCommaFirst.componentsSeparatedByString(", ")
  
  if components.count == 2 {
    last = components[0]
    first = components[1]
    return true
  }
  
  return false
}

extractFirstLastName(&first, &last, fullName)

println(first + " " + last)
