// Playground - noun: a place where people can play

import UIKit

func matchesForRegexInText(regex: String!, text: String!) -> [String] {
  
  let regex = NSRegularExpression(pattern: regex, options: nil, error: nil)!
  let nsString = text as NSString
  let results = regex.matchesInString(text, options: nil, range: NSMakeRange(0, nsString.length)) as [NSTextCheckingResult]
  return map(results) { nsString.substringWithRange($0.range)}
}

let str = "Hello, playground"
let strMatches = matchesForRegexInText("[a-z]+ground$", str)
println(strMatches)

let filename = "Filename[1]"
let filenameMatches = matchesForRegexInText("[(.*?)]", filename)
//let filenameMatches = matchesForRegexInText("(?<=[)[^[.]+?(?=])", filename)
println(filenameMatches)

//(?<=\[)[^\[.]+?(?=\])