//: Playground - noun: a place where people can play

import Foundation

struct A {
	var aVar: String = "A string"
	mutating func doNothing() {}
}

func testADoNothing() {
	var a = A()
	a.doNothing()
}

func testADoNothingWithDidSet() {
	var a = A() {
		didSet {
			print("a has changed")
		}
	}
	a.doNothing()
}

//testADoNothingWithDidSet()






struct B {
	var bVar: String = "B String"
	mutating func replaceWithOtherStruct() {
		var otherStruct = B()
		otherStruct.bVar = "B Other String"
		Namespace.myStruct = otherStruct
	}
}

class Namespace {
	static var myStructDidChange = false
	static var myStruct: B = B() {
		didSet {
			myStructDidChange = true
		}
	}
}

func testReplaceWithOtherStruct() {
	print("myStructDidChange? \(Namespace.myStructDidChange)")
	print("Namespace.myStruct.bVar: \(Namespace.myStruct.bVar)")
	Namespace.myStruct.replaceWithOtherStruct()
	print("myStructDidChange? \(Namespace.myStructDidChange)")
	print("Namespace.myStruct.bVar: \(Namespace.myStruct.bVar)")
}

testReplaceWithOtherStruct()
