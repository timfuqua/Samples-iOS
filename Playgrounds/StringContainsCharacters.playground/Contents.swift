//: Playground - noun: a place where people can play

import Foundation

extension String {
	
	func replaceCharacters(characters: String, withSeparator separator: String) -> String {
		let characterSet = NSCharacterSet(charactersInString: characters)
		let components = self.componentsSeparatedByCharactersInSet(characterSet)
		let result = components.joinWithSeparator(separator)
		return result
	}
	
	func eraseCharacters(characters: String) -> String {
		return replaceCharacters(characters, withSeparator: "")
	}
	
	func containsSomeCharacters(fromString characters: String) -> Bool {
		return componentsSeparatedByCharactersInSet(NSCharacterSet(charactersInString: characters)).count > 1
	}
	
	func otherContainsSomeCharacters(fromString characters: String) -> Bool {
		return stringByTrimmingCharactersInSet(NSCharacterSet(charactersInString: characters)) != self
	}
}

func testReplaceCharacters() {
	print("")
	print("testReplaceCharacters")
	
	let letters = "abcdefg"
	print(letters.replaceCharacters("abc", withSeparator: "#"))
}

func testEraseCharacters() {
	print("")
	print("testEraseCharacters")

	let letters = "abcdefg"
	print(letters.eraseCharacters("ace"))
}

func testContainsCharacters() {
	print("")
	print("testContainsCharacters")
	
	let letters = "abc defg "
	print("letters: \(letters)")
	print("letters.containsSomeCharacters(fromString: \"ace\"): \(letters.containsSomeCharacters(fromString: "ace"))")
	print("letters.containsSomeCharacters(fromString: \"xyz\"): \(letters.containsSomeCharacters(fromString: "xyz"))")
	print("letters.containsSomeCharacters(fromString: \"\"): \(letters.containsSomeCharacters(fromString: ""))")

	let noLetters = ""
	print("noLetters: \(noLetters)")
	print("noLetters.containsSomeCharacters(fromString: \"ace\"): \(noLetters.containsSomeCharacters(fromString: "ace"))")
	print("noLetters.containsSomeCharacters(fromString: \"xyz\"): \(noLetters.containsSomeCharacters(fromString: "xyz"))")
	print("noLetters.containsSomeCharacters(fromString: \"\"): \(noLetters.containsSomeCharacters(fromString: ""))")
	
	print("letters.otherContainsSomeCharacters(fromString: \"ace\"): \(letters.otherContainsSomeCharacters(fromString: "ace"))")
	print("letters.otherContainsSomeCharacters(fromString: \"xzy\"): \(letters.otherContainsSomeCharacters(fromString: "xyz"))")
}

//testReplaceCharacters()
//testEraseCharacters()
testContainsCharacters()
