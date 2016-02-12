import UIKit.UIGeometry

public extension UIEdgeInsets {
    
    init(width: CGFloat, edges: UIRectEdge = .All) {
        
        self.init(top: (edges & .Top) == nil ? 0 : width,
            left: (edges & .Left) == nil ? 0 : width,
            bottom: (edges & .Bottom) == nil ? 0 : width,
            right: (edges & .Right) == nil ? 0 : width
        )
    }
    
    private func insetsByRemoving(#edges: UIRectEdge) -> UIEdgeInsets {
        return self.dynamicType(top: (edges & .Top) == nil ? top : 0,
            left: (edges & .Left) == nil ? left : 0,
            bottom: (edges & .Bottom) == nil ? bottom : 0,
            right: (edges & .Right) == nil ? right : 0)
    }
    
    var horizontalInsets: UIEdgeInsets {
        return insetsByRemoving(edges: .Top | .Bottom)
    }
    
    var verticalInsets: UIEdgeInsets {
        return insetsByRemoving(edges: .Left | .Right)
    }
    
    func rotate(angleCG: CGFloat) -> UIEdgeInsets {
        let unit = M_PI * 2
        let toUnit = Double(angleCG) % unit
        let angle = toUnit < 0 ? toUnit + unit : toUnit
        if angle ~== M_PI_2 {
            return UIEdgeInsets(top: left, left: bottom, bottom: right, right: top)
        } else if angle ~== M_PI {
            return UIEdgeInsets(top: bottom, left: right, bottom: top, right: left)
        } else if angle ~== 3 * M_PI_2 {
            return UIEdgeInsets(top: right, left: top, bottom: left, right: bottom)
        }
        return self
    }
    
}

// MARK: Equatable

public func ==(lhs: UIEdgeInsets, rhs: UIEdgeInsets) -> Bool {
    return UIEdgeInsetsEqualToEdgeInsets(lhs, rhs)
}

extension UIEdgeInsets: Equatable {}

// MARK: Extrema

public func min(lhs: UIEdgeInsets, rhs: UIEdgeInsets, _ edges: UIRectEdge = .All) -> UIEdgeInsets {
    return UIEdgeInsets(top: (edges & .Top) == nil ? lhs.top : min(lhs.top, rhs.top),
        left: (edges & .Left) == nil ? lhs.left : min(lhs.left, rhs.left),
        bottom: (edges & .Bottom) == nil ? lhs.bottom : min(lhs.bottom, rhs.bottom),
        right: (edges & .Right) == nil ? lhs.right : min(lhs.right, rhs.right))
}

public func max(lhs: UIEdgeInsets, rhs: UIEdgeInsets, _ edges: UIRectEdge = .All) -> UIEdgeInsets {
    return UIEdgeInsets(top: (edges & .Top) == nil ? lhs.top : max(lhs.top, rhs.top),
        left: (edges & .Left) == nil ? lhs.left : max(lhs.left, rhs.left),
        bottom: (edges & .Bottom) == nil ? lhs.bottom : max(lhs.bottom, rhs.bottom),
        right: (edges & .Right) == nil ? lhs.right : max(lhs.right, rhs.right))
}

public func clamp(value: UIEdgeInsets, lower: UIEdgeInsets, upper: UIEdgeInsets, edges: UIRectEdge = .All) -> UIEdgeInsets {
    return max(min(value, upper, edges), lower, edges)
}
