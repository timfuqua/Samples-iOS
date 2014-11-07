// Playground - noun: a place where people can play

import UIKit

var myString = "Here is my string"
var myArray : [String] = myString.componentsSeparatedByString(" ")
//Returns a string array with the following values:  ["Here", "is", "my", "string"]

var someNumbersInAString: String = "0 0 200 200"
var someNumbersInAStringArray: [String] = someNumbersInAString.componentsSeparatedByString(" ")
var someNumbersInAnIntArray: [Int] = []

for values in someNumbersInAStringArray {
    someNumbersInAnIntArray.append(values.toInt()!)
}

println(someNumbersInAnIntArray)

var someNumbersInAFourTuple: (Int, Int, Int, Int) = (someNumbersInAnIntArray[0], someNumbersInAnIntArray[1], someNumbersInAnIntArray[2], someNumbersInAnIntArray[3])

var valuesRect: CGRect = CGRectMake(CGFloat(someNumbersInAnIntArray[0]), CGFloat(someNumbersInAnIntArray[1]), CGFloat(someNumbersInAnIntArray[2]), CGFloat(someNumbersInAnIntArray[3]))

var canvas: UIView = UIView(frame: valuesRect)
canvas.backgroundColor = UIColor.blueColor()

//var label: UILabel = UILabel(frame: CGRectMake(50, 50, 100, 50))
var label: UILabel = UILabel()
label.text = "My Title"
label.textColor = UIColor.whiteColor()
label.textAlignment = NSTextAlignment.Center
label.frame = CGRect(x: 50, y: 50, width: 100, height: 50)

canvas.addSubview(label)
