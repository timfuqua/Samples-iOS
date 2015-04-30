// Playground - noun: a place where people can play

import UIKit

typealias StringPair = (String, String)
typealias IntPair = (Int, Int)
typealias IntStringPair = (Int, String)

func printStringPairs(pairs: [StringPair]) {
  for pair in pairs {
    println("\(pair.0) of \(pair.1)")
  }
}

var pairsOfStrings: [StringPair] = []
pairsOfStrings.append(StringPair("Ace", "Spades"))
pairsOfStrings.append(StringPair("King", "Spades"))
pairsOfStrings.append(StringPair("Queen", "Spades"))
pairsOfStrings.append(StringPair("Jack", "Spades"))
pairsOfStrings.append(StringPair("10", "Spades"))

printStringPairs(pairsOfStrings)

pairsOfStrings[0].1 = "Hearts"

println()
printStringPairs(pairsOfStrings)
