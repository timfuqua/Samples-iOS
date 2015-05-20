//: # Regular Expressions
//:
//: From [NSRegularExpression Tutorial and Cheat Sheet](http://www.raywenderlich.com/86205/nsregularexpression-swift-tutorial)
//:
//: This playground demonstrates a lot of the key features of **NSRegularExpressions**. Read through it, take a look at the results, and feel free to play around with any of the examples! At any point you can use the **Editor > Reset Playground** menu item to reset any of your changes.
//:
//: ## Playground Setup
//:
//: The functions in this section simply support the rest of the playground. They're used to highlight, list, and replace matches in strings, as well as listing groups. For any of the examples below, you should be able to see the effect in the results pane of the playground. For highlighting examples, hover over the result and click the eye or the plus icon to see the highlighted text.
//:
//: The first time you look through these examples, don't feel like you have to understand all of the code below - instead, just scroll down to view the **Basic Examples** and **Cheat Sheet**.

import UIKit

func highlightMatches(pattern: String, inString string: String) -> NSAttributedString {
    let regex = NSRegularExpression(pattern: pattern, options: .allZeros, error: nil)
    let range = NSMakeRange(0, count(string))
    let matches = regex?.matchesInString(string, options: .allZeros, range: range) as! [NSTextCheckingResult]
    
    let attributedText = NSMutableAttributedString(string: string)
    
    for match in matches {
        attributedText.addAttribute(NSBackgroundColorAttributeName, value: UIColor.yellowColor(), range: match.range)
    }
    
    return attributedText.copy() as! NSAttributedString
}

func listMatches(pattern: String, inString string: String) -> [String] {
    let regex = NSRegularExpression(pattern: pattern, options: .allZeros, error: nil)
    let range = NSMakeRange(0, count(string))
    let matches = regex?.matchesInString(string, options: .allZeros, range: range) as! [NSTextCheckingResult]
    
    return matches.map {
        let range = $0.range
        return (string as NSString).substringWithRange(range)
    }
}

func listGroups(pattern: String, inString string: String) -> [String] {
    let regex = NSRegularExpression(pattern: pattern, options: .allZeros, error: nil)
    let range = NSMakeRange(0, count(string))
    let matches = regex?.matchesInString(string, options: .allZeros, range: range) as! [NSTextCheckingResult]
    
    var groupMatches = [String]()
    for match in matches {
        let rangeCount = match.numberOfRanges
        
        for group in 0..<rangeCount {
            groupMatches.append((string as NSString).substringWithRange(match.rangeAtIndex(group)))
        }
    }
    
    return groupMatches
}

func containsMatch(pattern: String, inString string: String) -> Bool {
    let regex = NSRegularExpression(pattern: pattern, options: .allZeros, error: nil)
    let range = NSMakeRange(0, count(string))
    return regex?.firstMatchInString(string, options: .allZeros, range: range) != nil
}

func replaceMatches(pattern: String, inString string: String, withString replacementString: String) -> String? {
    let regex = NSRegularExpression(pattern: pattern, options: .allZeros, error: nil)
    let range = NSMakeRange(0, count(string))
    
    return regex?.stringByReplacingMatchesInString(string, options: .allZeros, range: range, withTemplate: replacementString)
}

//: ## Basic Examples
//:
//: This first example is about as simple as regular expressions get! It matches the word "jump" in the sample text:

let quickFox = "The quick brown fox jumps over the lazy dog."

listMatches("jump", inString: quickFox)

//: This next example uses some special characters that are available in regular expressions. The parenthesis create a group, and the question mark says "match the previous element (the group in this case) 0 or 1 times". It matches either 'jump' or 'jumps':

listMatches("jump(s)?", inString: quickFox)

//: This one matches an HTML or XML tag:

let htmlString = "<p>This is an example <strong>html</strong> string.</p>"

listMatches("<([a-z][a-z0-9]*)\\b[^>]*>(.*?)", inString: htmlString)

//: Wow, looks complicated, eh? :] Hopefully things will become a bit more clear as you look through the rest of the examples here!

//: ## Cheat Sheet
//: 
//: **.** matches any character. `p.p` matches pop, pup, pmp, p@p, and so on.

let anyExample = "pip, pop, p%p, paap, piip, puup, pippin"
listMatches("p.p", inString: anyExample)

//:  **\w** matches any 'word-like' character which includes the set of numbers, letters, and underscore, but does not match punctuation or other symbols. `hello\w` will match "hello_9" and "helloo" but not "hello!"

let wordExample = "hello helloooooo hello_1114 hello, hello!"
listMatches("hello\\w+", inString: wordExample)

//: **\d** matches a numeric digit, which in most cases means `[0-9]`. `\d\d?:\d\d` will match strings in time format, such as "9:30" and "12:45".

let digitExample = "9:30 12:45 df:24 ag:gh"
listMatches("\\d?\\d:\\d\\d", inString: digitExample)

//: **\b** matches word boundary characters such as spaces and punctuation. `to\b` will match the "to" in "to the moon" and "to!", but it will not match "tomorrow". `\b` is handy for "whole word" type matching.

let boundaryExample = "to the moon! when to go? tomorrow?"
listMatches("to\\b", inString: boundaryExample)

//: **\s** matches whitespace characters such as spaces, tabs, and newlines. `hello\s` will match "hello " in "Well, hello there!".

let whitespaceExample = "Well, hello there!"
listMatches("hello\\s", inString: whitespaceExample)

//: **^** matches at the beginning of a line. Note that this particular ^ is different from ^ inside of the square brackets! For example, `^Hello` will match against the string "Hello there", but not "He said Hello".

let beginningExample = "Hello there! He said hello."
highlightMatches("^Hello", inString: beginningExample)

//: **$** matches at the end of a line. For example, `the end$` will match against "It was the end" but not "the end was near"

let endExample = "The end was near. It was the end"
highlightMatches("end$", inString: endExample)

//: **\*** matches the previous element 0 or more times. `12*3` will match 13, 123, 1223, 122223, and 1222222223.

let zeroOrMoreExample = "13, 123, 1223, 122223, 1222222223, 143222343"
highlightMatches("12*3", inString: zeroOrMoreExample)

//: **+** matches the previous element 1 or more times. `12+3` will match 123, 1223, 122223, 1222222223, but not 13.

let oneOrMoreExample = "13, 123, 1223, 122223, 1222222223, 143222343"
highlightMatches("12+3", inString: oneOrMoreExample)

//: `?` matches the previous element 0 or 1 times. `12?3` will match 13 or 123, but not 1223.

let possibleExample = "13, 123, 1223"
highlightMatches("12?3", inString: oneOrMoreExample)

//: Curly braces **{ }** contain the minimum and maximum number of matches. For example, `10{1,2}1` will match both "101" and "1001" but not "10001" as the minimum number of matches is 1 and the maximum number of matches is 2. `He[Ll]{2,}o` will match "HeLLo" and "HellLLLllo" and any such silly variation of "hello" with lots of L’s, since the minimum number of matches is 2 but the maximum number of matches is not set — and therefore unlimited!

let numberExample1 = "101 1001 10001"
let numberExample2 = "HeLLo HellLLLllo"
highlightMatches("10{1,2}1", inString: numberExample1)
highlightMatches("He[Ll]{2,}", inString: numberExample2)

//: Capturing parentheses **( )** are used to group part of a pattern. For example, `3 (pm|am)` would match the text "3 pm" as well as the text "3 am". The pipe character here (|) acts like an OR operator.

let cinema = "Are we going to the cinema at 3 pm or 5 pm?"
listMatches("\\d (am|pm)", inString: cinema)
listGroups("(\\d (am|pm))", inString: cinema)

//: You can include as many pipe characters in your regular expression as you would like. As an example, `(Tom|Dick|Harry)` is a valid pattern.

let greeting = "Hello Tom, Dick, Harry!"
listMatches("(Tom|Dick|Harry)", inString: greeting)
replaceMatches("(Tom|Dick|Harry)", inString: greeting, withString: "James")

//: Character classes represent a set of possible single-character matches. Character classes appear between square brackets **[ ]**.
//: As an example, the regular expression `t[aeiou]` will match "ta", "te", "ti", "to", or "tu". You can have as many character possibilities inside the square brackets as you like, but remember that any single character in the set will match. `[aeiou]` _looks_ like five characters, but it actually means "a" or "e" or "i" or "o" or "u".

let theVowels = "ta te ti to tu th tj tk tm"
listMatches("t[aeiou]", inString: theVowels)

//: You can also define a range in a character class if the characters appear consecutively. For example, to search for a number between 100 to 109, the pattern would be `10[0-9]`. This returns the same results as `10[0123456789]`, but using ranges makes your regular expressions much cleaner and easier to understand. Ranges can also be used for characters - for example, `[a-z]` matches all lowercase characters, or `[a-zA-Z]` matches all upper and lower case.

let theNumbers = "100 101 105 121 229 816"
listMatches("10[0-9]", inString: theNumbers)
listMatches("t[a-h]", inString: theVowels)

//: Character classes usually contain the characters you _want_ to match, but what if you want to explicitly _not match_ a character? You can also define negated character classes, which use the `^` character. For example, the pattern `t[^o]` will match any combination of "t" and one other character _except_ for the single instance of "to".

let notClasses = "tim tam tum tom tem"
listMatches("t[^oa]m", inString: notClasses)

