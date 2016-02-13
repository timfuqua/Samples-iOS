//: Playground - noun: a place where people can play

import UIKit

extension String {
  func chopPrefix(count: Int = 1) -> String {
    return self.substringFromIndex(self.startIndex.advancedBy(count))
  }
  
  func chopSuffix(count: Int = 1) -> String {
    return self.substringToIndex(self.endIndex.advancedBy(-count))
  }
}

let filePath = NSBundle.mainBundle().pathForResource("BaseSet", ofType: "txt")
let contentData = NSFileManager.defaultManager().contentsAtPath(filePath!)
let content = NSString(data: contentData!, encoding: NSUTF8StringEncoding) as? String

var contentLines = content!.componentsSeparatedByString("\n")
contentLines.count

func parsePokemonText() {
  func printContentLines() {
    contentLines.forEach { print($0) }
  }
  
  func removeUnusedHeaderAndFooterLines(inout fromContentLines contentLines: [String]) {
    contentLines.removeFirst(4)
    for _ in 0..<4 {
      contentLines.removeLast()
    }
  }
  
  removeUnusedHeaderAndFooterLines(fromContentLines: &contentLines)
  
  func extractNumCards(inout fromContentLines contentLines: [String]) -> String {
    var contentLine = contentLines.removeFirst()
    contentLine = contentLine.stringByReplacingOccurrencesOfString("[", withString: "")
    contentLine = contentLine.stringByReplacingOccurrencesOfString("]", withString: "")
    contentLine = contentLine.stringByReplacingOccurrencesOfString(" ", withString: "")
    contentLine = contentLine.chopPrefix(2)
    
    return contentLine
  }
  
  let numCardsInSet = extractNumCards(fromContentLines: &contentLines)
  
  func adjustNewlines(inout inContentLines contentLines: [String]) {
    for (index, contentLine) in contentLines.enumerate() {
      if contentLine.isEmpty {
        contentLines.insert(contentLines.removeAtIndex(index), atIndex: index-3)
      }
    }
    
    contentLines.removeFirst()
  }
  
  adjustNewlines(inContentLines: &contentLines)
  
  var cardsText = [[String]]()
  func printCardsText() {
    cardsText.forEach { print($0, terminator: "\n\n") }
  }
  
  func separate(contentLines: [String], inout intoCards cardsText: [[String]]) {
    cardsText = contentLines.split("").map { return Array($0) }
  }
  
  separate(contentLines, intoCards: &cardsText)
//  printCardsText()
  
  func removeTextRatingProxiesRulingsDiscussionFromEachCard(inout inCardsText cardsText: [[String]]) {
    cardsText = cardsText.map {
      var cardWithRemovedText = $0
      cardWithRemovedText.removeAtIndex(2)
      return cardWithRemovedText
    }
  }
  
  removeTextRatingProxiesRulingsDiscussionFromEachCard(inCardsText: &cardsText)
//  printCardsText()
  
  func removeBuyItOnAmazonFromEachCard(inout inCardsText cardsText: [[String]]) {
    cardsText = cardsText.map {
      var cardWithRemovedText = $0
      cardWithRemovedText.removeAtIndex(2)
      return cardWithRemovedText
    }
  }
  
  removeBuyItOnAmazonFromEachCard(inCardsText: &cardsText)
  printCardsText()
  
//  printContentLines()
}

//parsePokemonText()








