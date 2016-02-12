//: ## Geometry Extensions

import UIKit
import XCPlayground

let demoView = UIView(frame: CGRect(x: 0, y: 0, width: 320, height: 100))
demoView.setTranslatesAutoresizingMaskIntoConstraints(false)
demoView.backgroundColor = UIColor.redColor()
//XCPShowView("Demo View", demoView)

let angle = CGFloat(M_PI_2) /*toRadians(90) */

//: ### `CATransform3D`
//:
//: Initializers
CATransform3D(tx: 12)
CATransform3D(sx: 1.5, sy: 1.5)
CATransform3D(scale: 1.5)
CATransform3D(angle: CGFloat(M_PI_2), x: 12, y: 0, z: 0)
CATransform3D(CATransform3D(scale: 2), CATransform3D(ty: 12))
CATransform3D(CGAffineTransform(scale: 2), CGAffineTransform(ty: 12))

//: Properties
CATransform3D.identity.isIdentity
CATransform3D(sx: 1.5, sy: 1.5, sz: 1).affineTransform

//: Transformations and Equatable
CATransform3D.identity.translated(x: 12) == CATransform3D(tx: 12)
CATransform3D.identity.scaled(1.5) == CATransform3D(scale: 1.5)
CATransform3D.identity.rotated(CGFloat(M_PI_2), x: 24, y: 0, z: 0) == CATransform3D(angle: CGFloat(M_PI_2), x: 24, y: 0, z: 0)

//: Arithmetic
-CATransform3D(scale: 2) == CATransform3D(scale: 0.5)
let add1 = CATransform3D(tx: 12) + CATransform3D(scale: 2)
let subtract1 = CATransform3D(tx: 12) - CATransform3D(scale: 2)
let add2 = CATransform3D(tx: 12) + CGAffineTransform(scale: 2)

//: ### `CGAffineTransform`
//:
//: Initializers
let baseTransform1 = CGAffineTransform(scale: 2)
let baseTransform2 = CGAffineTransform(tx: 12)
let baseTransform3 = CGAffineTransform(sx: 1.5)
CGAffineTransform(baseTransform1, baseTransform2)

//: Printing
toString(baseTransform1)

//: Properties
CGAffineTransform.identity.isIdentity

//: Transformations and Equatable
CGAffineTransform.identity.translated(x: 12) == CGAffineTransform(tx: 12)
CGAffineTransform.identity.scaled(1.5) == CGAffineTransform(scale: 1.5)
CGAffineTransform.identity.rotated(angle) == CGAffineTransform(angle: angle)

//: Arithmetic
-CGAffineTransform(scale: 2) == CGAffineTransform(scale: 0.5)
CGAffineTransform(tx: 12) + CGAffineTransform(scale: 2)
CGAffineTransform(tx: 12) - CGAffineTransform(scale: 2)

//: Application
let applyTransform = CGAffineTransform(scale: 2)
CGRect(x: 12, y: 12, width: 24, height: 48) * applyTransform
CGPoint(x: 12, y: 12) * applyTransform
CGSize(width: 24, height: 48) * applyTransform

//: ### `CGPoint`

let basePoint = CGPoint(x: 16, y: 24)
let altPoint = CGPoint(x: 24, y: 16)

//: Printing
toString(basePoint)

//: Vector arithmetic
basePoint + altPoint
basePoint - altPoint
basePoint + altPoint
basePoint - altPoint

//: Scalar arithmetic
basePoint * 2
basePoint / 2

//: Trigonometry
basePoint...altPoint
basePoint.midpoint(altPoint)





//: ### CGRect

let baseRect = CGRect(x: 32, y: 32, width: 512, height: 128)

//: Printing
toString(baseRect)

//: Geometry
baseRect.center

//: Separator rect: get a hairline for a given rect edge
let separatorRect1 = baseRect.separatorRect(edge: .MinXEdge)
let separatorRect2 = baseRect.separatorRect(edge: .MinYEdge)
let separatorRect3 = baseRect.separatorRect(edge: .MaxXEdge)
let separatorRect4 = baseRect.separatorRect(edge: .MaxYEdge)
let separatorRect5 = baseRect.separatorRect(edge: .MaxYEdge, thickness: demoView.hairline)

//: Mutating version of rect divide (for iterative processes)
var dividingRect = baseRect
let slice1 = dividingRect.divide(24, fromEdge: .MinYEdge)
let slice2 = dividingRect.divide(24, fromEdge: .MinYEdge)
let slice3 = dividingRect.divide(24, fromEdge: .MinYEdge)
let slice4 = dividingRect.divide(24, fromEdge: .MinYEdge)
let slice5 = dividingRect.divide(24, fromEdge: .MinYEdge)
let slice6 = dividingRect.divide(24, fromEdge: .MinYEdge)
dividingRect

//: Rect insetting
let insetRect = demoView.frame.rectByInsetting(UIEdgeInsets(width: 12, edges: .Top))

//: Corner manipulations
let corners = baseRect.corners
let rectWithCorners = CGRect(corners: corners)
let newRect = baseRect.mapCorners { $0 + CGPoint(x: 12, y: 12) }

//: Integration
let toCenterIn = CGRect(x: 25, y: 25, width: 75, height: 75)
let fiddlyRect = CGRect(x: 12.5, y: 19, width: 14.25, height: 11)

fiddlyRect.integerRect(1)
fiddlyRect.integerRect(2)
fiddlyRect.rectCentered(inRect: toCenterIn, scale: 2)
fiddlyRect.rectCentered(xInRect: toCenterIn, scale: 2)
fiddlyRect.rectCentered(yInRect: toCenterIn, scale: 2)
fiddlyRect.rectCentered(about: fiddlyRect.origin, scale: 2)

//: ### `CGSize`

let baseSize = CGSize(width: 48, height: 96)
let altSize = CGSize(width: 96, height: 48)

//: Printing
toString(baseSize)

//: Vector arithmetic
baseSize + altSize
baseSize - altSize
baseSize + altSize
baseSize - altSize

//: Scalar arithmetic
baseSize * 2
baseSize / 2

//: ### Geometric scaling
//:
//: Though Swift has more robust operators and methods for UIKit geometry, there
//: are problems it still doesn't solve.
//:
//: Scale geometric values for use with screen display
let rounded1 = demoView.rround(1.5)
let rounded2 = demoView.rround(4/3)
let rounded3 = demoView.rround(1.75)

//: ### Comparison utilities
//: Approximately compare geometric values to compensate for floating point error
1.9999999999999999 ~== 2.0

//: ### `UIEdgeInsets`
//:
//: Initializer with common edges
let insets1 = UIEdgeInsets(width: 22, edges: .Top)

//: Equatability
UIEdgeInsets() == UIEdgeInsetsZero
UIEdgeInsetsMake(12, 12, 12, 12) == UIEdgeInsets(width: 12)
UIEdgeInsets() == UIEdgeInsets(width: 22)

//: Edge removal
let insets2 = UIEdgeInsets(width: 12)
let insets3 = insets2.horizontalInsets
let insets4 = insets2.verticalInsets

//: Cardinal rotation
let toBeRotatedInsets = UIEdgeInsets(top: 12, left: 0, bottom: 0, right: 0)
let rotatedInsets1 = toBeRotatedInsets.rotate(toRadians(-90))
let rotatedInsets2 = toBeRotatedInsets.rotate(toRadians(0))
let rotatedInsets3 = toBeRotatedInsets.rotate(toRadians(90))
let rotatedInsets4 = toBeRotatedInsets.rotate(toRadians(180))
let rotatedInsets5 = toBeRotatedInsets.rotate(toRadians(270))
let rotatedInsets6 = toBeRotatedInsets.rotate(toRadians(360))
let rotatedInsets7 = toBeRotatedInsets.rotate(toRadians(450))

//: Extrema
let leftInsets = UIEdgeInsets(width: 24)
let rightInsets = UIEdgeInsets(top: 12, left: 0, bottom: 0, right: 0)
min(leftInsets, rightInsets)
max(leftInsets, rightInsets)
min(leftInsets, rightInsets, .Top)
max(leftInsets, rightInsets, .Top)

//: Rect insetting
let inset1 = baseRect.rectByInsetting(UIEdgeInsets(top: 2, left: 2, bottom: 4, right: 4))

//: ### `UIUserInterfaceLayoutDirection`
//:
//: Extension-safe API of `UIApplication`
UIUserInterfaceLayoutDirection.userLayoutDirection

//: ### `UIView`
//:
//: Scale of the window the view is in (always 1 when not in "Full Simulator")
demoView.scale
//:
//: Uses `scale` to determine a good thickness for a content separator
demoView.hairline

//: ### Misc. Utilities

Version.isiOS7
Version.isiOS8

//: Degree/radian conversion

toRadians(-90) ~== -M_PI_2
toRadians(90) ~== M_PI_2
toRadians(180) ~== M_PI
toRadians(270) ~== 3 * M_PI_2
toRadians(360) ~== 2 * M_PI
toRadians(450) ~== 5 * M_PI_2

toDegrees(M_PI_2)
toDegrees(M_PI)
toDegrees(M_PI_2 * 3)
