// Playground - noun: a place where people can play

import UIKit
import Foundation

let canvas = UIView(frame: CGRect(x:0, y:0, width:400, height:400))
canvas.backgroundColor = UIColor.blueColor()

let label1 = UILabel(frame: CGRect(x: 50, y: 50, width: 100, height: 50))
label1.backgroundColor = UIColor.redColor()
label1.text = "Label 1"

canvas.addSubview(label1)

let label2 = UILabel(frame: CGRect(x: 50, y: 150, width: 100, height: 50))
label2.backgroundColor = UIColor.greenColor()
label2.text = "Label 2"

canvas.addSubview(label2)

func hasProperty(object: NSObject, property: String) -> Bool {
    
    return object.respondsToSelector(Selector(property))
}

hasProperty(canvas, "frame")
hasProperty(label1, "frame")

hasProperty(canvas, "text")
hasProperty(label1, "text")

let property: NSObject = label1.valueForKey("text")! as NSObject

reflect(property).count
reflect(property)[0].0
reflect(property)[0].1.summary
reflect(property)[0].1.value
reflect(property)[0].1.valueType


let someString: String = "string"

reflect(someString).count
reflect(someString).0
reflect(someString).0.summary
reflect(someString).0.value
reflect(someString).0.valueType
reflect(someString).summary
reflect(someString).value
reflect(someString).valueType


let textProperty: NSObject = label1.valueForKey("text")! as NSObject
let frameProperty: NSObject = label1.valueForKey("frame")! as NSObject

hasProperty(label1, "setFrame:")
hasProperty(label1, "setText:")
hasProperty(label1, "setBackgroundColor:")


textProperty.isKindOfClass(NSString)
textProperty is String
textProperty is NSString







