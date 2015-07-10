// Create a wireframe mesh of equilateral triangles connected together

import UIKit

enum TriangleOrientation {
  case Up, Down
}

struct Triangle {
  private var radius: CGFloat? {
    get {
      return sideLength != nil ? sideLength!*0.433013 : nil
    }
  }
  private(set) var verts: [CGPoint] = [CGPointMake(0, 0), CGPointMake(0, 0), CGPointMake(0, 0)]
  var fillColor: UIColor = UIColor.clearColor()
  var sideLength: CGFloat? = nil {
    didSet {
      if center != nil && orientation != nil {
        generateVerts()
      }
    }
  }
  var center: CGPoint? = nil {
    didSet {
      if sideLength != nil && orientation != nil {
        generateVerts()
      }
    }
  }
  var orientation: TriangleOrientation? = nil {
    didSet {
      if sideLength != nil && center != nil {
        generateVerts()
      }
    }
  }
  
  private func generateVerts() {
    
  }
}

let firstTriangle = Triangle()




func drawTriangleGrid() {
  let size = CGSize(width: 120, height: 200)
  
  UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
  let context = UIGraphicsGetCurrentContext()
  
  //This code must always be at the end of the playground
  let image = UIGraphicsGetImageFromCurrentImageContext()
  UIGraphicsEndImageContext()
}


//drawTriangleGrid()
