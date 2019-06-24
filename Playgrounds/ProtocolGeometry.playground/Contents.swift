import Foundation
import UIKit

func distance(a: CGPoint, b: CGPoint) -> CGFloat {
	let dx = b.x - a.x, dy = b.y - a.y
	return sqrt(dx*dx + dy*dy)
}

protocol HasPoints {
	var numPoints: Int { get }
	var points: [CGPoint] { get set }
	func printPoints()
	init()
}

extension HasPoints {
	func printPoints() {
		print("Points: \(points.map({ "\($0)" }).joinWithSeparator(" "))")
	}
	
	init?(points: [CGPoint]) {
		self.init()
		
		guard points.count == numPoints else {
			return nil
		}
		
		self.points = points
	}
}

protocol HasArea: HasPoints {
	var area: CGFloat { get }
}

extension HasArea {
	var area: CGFloat {
		func subArea(a: CGPoint, b: CGPoint) -> CGFloat {
			return (a.x*b.y - a.y*b.x)
		}
		
		var runningTotal: CGFloat = 0.0
		for i in 0..<points.count {
			runningTotal += subArea(points[i], b: points[(i+1)%points.count])
		}
		return 0.5*runningTotal
	}
}

struct Triangle: HasArea {
	var numPoints: Int = 3
	var points: [CGPoint] = []
}

print("")
let aTriangle = Triangle(points: [CGPoint(x: 0, y: 0), CGPoint(x: 6, y: 0), CGPoint(x: 3, y: 3)])
aTriangle?.printPoints()
print("aTriangle.area: \(aTriangle?.area)")

print("")
let bTriangle = Triangle(points: [CGPoint(x: 0, y: 0), CGPoint(x: 6, y: 0), CGPoint(x: 0, y: 6)])
bTriangle?.printPoints()
print("bTriangle.area: \(bTriangle?.area)")




struct Rectangle: HasArea {
	var numPoints: Int = 4
	var points: [CGPoint] = []
}

print("")
let notARectangle = Rectangle(points: [CGPoint(x: 0, y: 0), CGPoint(x: 6, y: 0), CGPoint(x: 3, y: 3)])
notARectangle?.printPoints()
print("notARectangle.area: \(notARectangle?.area)")

print("")
let aRectangle = Rectangle(points: [CGPoint(x: 0, y: 0), CGPoint(x: 6, y: 0), CGPoint(x: 6, y: 6), CGPoint(x: 0, y: 6)])
aRectangle!.printPoints()
print("aRectangle.area: \(aRectangle!.area)")

print("")
let bRectangle = Rectangle(points: [CGPoint(x: 3, y: 0), CGPoint(x: 3, y: 3), CGPoint(x: 3, y: 6), CGPoint(x: 0, y: 3)])
bRectangle!.printPoints()
print("bRectangle.area: \(bRectangle!.area)")



struct Octagon: HasArea {
	var numPoints: Int = 8
	var points: [CGPoint] = []
}

print("")
let anOctagon = Octagon(points: [CGPoint(x: 1, y: 0), CGPoint(x: 2, y: 0), CGPoint(x: 3, y: 1), CGPoint(x: 3, y: 2), CGPoint(x: 2, y: 3), CGPoint(x: 1, y: 3), CGPoint(x: 0, y: 2), CGPoint(x: 0, y: 1)])
anOctagon!.printPoints()
print("anOctagon.area: \(anOctagon!.area)")
