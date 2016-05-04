import Foundation
import UIKit

extension String {
	
	func containsOnlyCharacters(fromString characters: String) -> Bool {
		return stringByTrimmingCharactersInSet(NSCharacterSet(charactersInString: characters)) == ""
	}
	
	var isNumeric: Bool {
		return containsOnlyCharacters(fromString: "1234567890")
	}
	
}

func stringIsNumeric(userString: String) -> Bool {
	return Int(userString) != nil
}

stringIsNumeric("1234567890")
stringIsNumeric("01234567890")
stringIsNumeric("-1234567890")
stringIsNumeric("3.14159")
stringIsNumeric("12345678901234567890")

let numeralString = "123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890"
numeralString.containsOnlyCharacters(fromString: "1234567890")
numeralString.isNumeric
