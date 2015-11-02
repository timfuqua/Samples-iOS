// Create a wireframe mesh of equilateral triangles connected together

import UIKit

enum TriangleOrientation {
  case Up, Down
}

struct Triangle {
  private var apothem: CGFloat? {
    get {
      return sideLength != nil ? sideLength!*0.288675 : nil
    }
  }
  private(set) var verts: [CGPoint] = [CGPointMake(0, 0), CGPointMake(0, 0), CGPointMake(0, 0)]
  var p1: CGPoint { get { return verts[0] } }
  var p2: CGPoint { get { return verts[1] } }
  var p3: CGPoint { get { return verts[2] } }
  var sideLength: CGFloat? = nil {
    didSet {
      if center != nil && orientation != nil && sideLength! > 0 {
        generateVerts()
      }
    }
  }
  var center: CGPoint? = nil {
    didSet {
      if sideLength != nil && sideLength! > 0 && orientation != nil {
        generateVerts()
      }
    }
  }
  var orientation: TriangleOrientation? = nil {
    didSet {
      if sideLength != nil && sideLength! > 0 && center != nil {
        generateVerts()
      }
    }
  }
  var strokeColor: UIColor = UIColor.blackColor()
  var fillColor: UIColor = UIColor.clearColor()
  
  init() { }
  
  init(sideLength: CGFloat, center: CGPoint, orientation: TriangleOrientation, strokeColor: UIColor, fillColor: UIColor) {
    self.sideLength = sideLength
    self.center = center
    self.orientation = orientation
    self.strokeColor = strokeColor
    self.fillColor = fillColor
  }
  
  func draw() {
    var path = UIBezierPath()
    path.moveToPoint(p1)
    path.addLineToPoint(p2)
    path.addLineToPoint(p3)
    path.closePath()
    path.lineWidth = 1
    strokeColor.setStroke()
    path.stroke()
    fillColor.setFill()
    path.fill()
  }
  
  private mutating func generateVerts() {
    assert(verts.count == 3, "verts should always have exactly 3 points in it")
    assert(apothem != nil && sideLength != nil && center != nil && orientation != nil, "All parts of the triangle object must be non-nil before generating verts")
    
    if verts.count == 3 && apothem != nil && sideLength != nil && center != nil && orientation != nil {
      let b: CGFloat = orientation! == .Up ? apothem! : -apothem!
      let c: CGFloat = -2*b
      let halfSide: CGFloat = sideLength!/2
      
      verts[0].x = center!.x - halfSide
      verts[0].y = center!.y + b
      verts[1].x = center!.x
      verts[1].y = center!.y + c
      verts[2].x = center!.x + halfSide
      verts[2].y = center!.y + b
    }
  }
}

func createTriangleAtGridCoord(#x: Int, #y: Int, withSideLength sideLength: CGFloat, strokeColor: UIColor = UIColor.blackColor(), fillColor: UIColor = UIColor.clearColor()) -> Triangle {
  assert(x >= 0, "Grid coord x value must be non-negative.")
  assert(y >= 0, "Grid coord y value must be non-negative.")
  assert(sideLength >= 0, "Side length must be non-negative.")
  
  if x >= 0 && y >= 0 && sideLength >= 0 {
    var tri: Triangle = Triangle()
    tri.sideLength = sideLength
    tri.orientation = (x+y)%2 == 0 ? .Up : .Down
    let k: CGFloat = tri.orientation! == .Up ? 2*tri.apothem! : tri.apothem!
    tri.center = CGPointMake((CGFloat(x+1)/2)*tri.sideLength!, k + 3*CGFloat(y)*tri.apothem!)
    tri.strokeColor = strokeColor
    tri.fillColor = fillColor
    
    return tri
  }
  else {
    return Triangle()
  }
}

extension CGPoint {
  func distanceTo(otherPoint: CGPoint) -> CGFloat {
    return sqrt(self.distanceSquaredTo(otherPoint))
  }
  
  func distanceSquaredTo(otherPoint: CGPoint) -> CGFloat {
    let xDisp: CGFloat = otherPoint.x - self.x
    let yDisp: CGFloat = otherPoint.y - self.y
    return (xDisp*xDisp) + (yDisp*yDisp)
  }
}

func testTriangleSideLengths() {
  println("Create a triangle at grid coord 0,0 with side length of 10 and see if each edge has length 10.")
  let tri = createTriangleAtGridCoord(x: 0, y: 0, withSideLength: 10)
  
  let firstDistanceSquared: CGFloat = tri.verts[0].distanceSquaredTo(tri.verts[1])
  let secondDistanceSquared: CGFloat = tri.verts[1].distanceSquaredTo(tri.verts[2])
  let thirdDistanceSquared: CGFloat = tri.verts[2].distanceSquaredTo(tri.verts[0])
  let sideLengthSquare: CGFloat = tri.sideLength!*tri.sideLength!
  
  if sideLengthSquare - firstDistanceSquared > 0.001 {
    println("Distance between P1 and P2 is not correct. Should be \(tri.sideLength!), but instead is \(tri.verts[0].distanceTo(tri.verts[1]))")
  }
  else {
    println("Distance between P1 and P2 is correct")
  }
  
  if sideLengthSquare - secondDistanceSquared > 0.001 {
    println("Distance between P2 and P3 is not correct. Should be \(tri.sideLength!), but instead is \(tri.verts[1].distanceTo(tri.verts[2]))")
  }
  else {
    println("Distance between P2 and P3 is correct")
  }
  
  if sideLengthSquare - thirdDistanceSquared > 0.001 {
    println("Distance between P3 and P1 is not correct. Should be \(tri.sideLength!), but instead is \(tri.verts[2].distanceTo(tri.verts[0]))")
  }
  else {
    println("Distance between P3 and P1 is correct")
  }
  
  println()
}

func testDrawTriangle(#sideLength: CGFloat) {
  println("Create a triangle at grid coord 0,0 with side length of \(sideLength) and draw it to the graphics context")
  let tri = createTriangleAtGridCoord(x: 0, y: 0, withSideLength: sideLength)
  
  let size = CGSize(width: sideLength, height: sideLength)
  
  UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
  let context = UIGraphicsGetCurrentContext()
  
//  var path = UIBezierPath()
//  path.moveToPoint(tri.p1)
//  path.addLineToPoint(tri.p2)
//  path.addLineToPoint(tri.p3)
//  path.closePath()
//  path.lineWidth = 1
//  tri.strokeColor.setStroke()
//  path.stroke()
//  tri.fillColor.setFill()
//  path.fill()
  tri.draw()
  
  //This code must always be at the end of the playground
  let image = UIGraphicsGetImageFromCurrentImageContext()
  UIGraphicsEndImageContext()
  
  println()
}

func testDrawTriangleRow(#sideLength: CGFloat, #startX: Int, #endX: Int, #y: Int) {
  assert(sideLength > 0, "Side length must be non-negative")
  assert(startX >= 0, "Starting x coord must be non-negative")
  assert(endX >= 0, "Ending x coord must be non-negative")
  assert(endX > startX, "Ending x coord must be greater than starting x coord")
  assert(y >= 0, "Row must be non-negative")
  
  if sideLength > 0 && startX >= 0 && endX >= 0 && endX > startX && y >= 0 {
    println("Create a row of triangles at grid coords (\(startX),\(y)) to (\(endX),\(y)) with side length of \(sideLength) and draw it to the graphics context")
    
    var grid: [Triangle] = []
    
    for i in startX...endX {
      grid.append(createTriangleAtGridCoord(x: i, y: y, withSideLength: sideLength))
    }
    
//    let size = CGSize(width: (CGFloat(endX-startX+2)*grid[0].sideLength!)/2, height: CGFloat(3*grid[0].apothem!))
    let size = CGSize(width: 100, height: 100)
    
    UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
    let context = UIGraphicsGetCurrentContext()
    
    for tri in grid {
      tri.draw()
    }
    
    //This code must always be at the end of the playground
    let image = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    
    println()
  }
}

func drawTriangleGrid() {
  
  var grid: [Triangle] = []
  
  let sideLength: CGFloat = 30
  let maxGridX: Int = 12
  let maxGridY: Int = 7
  for i in 0..<maxGridX {
    for j in 0..<maxGridY {
      grid.append(createTriangleAtGridCoord(x: i, y: j, withSideLength: sideLength, fillColor: UIColor.orangeColor()))
    }
  }
  
  let size = CGSize(width: 200, height: 200)
  
  UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
  let context = UIGraphicsGetCurrentContext()
  
  for tri in grid {
    tri.draw()
  }
  
  //This code must always be at the end of the playground
  let image = UIGraphicsGetImageFromCurrentImageContext()
  UIGraphicsEndImageContext()
}


//testTriangleSideLengths()
//testDrawTriangle(sideLength: 30)
//testDrawTriangleRow(sideLength: 30, startX: 0, endX: 3, y: 0)
//testDrawTriangleRow(sideLength: 30, startX: 0, endX: 3, y: 1)

drawTriangleGrid()
