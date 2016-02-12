import UIKit

infix operator ~== { associativity none precedence 130 }
infix operator !~== { associativity none precedence 130 }

public protocol GeometricMeasure: AbsoluteValuable, Comparable {
    func *(lhs: Self, rhs: Self) -> Self
    func /(lhs: Self, rhs: Self) -> Self
    static var identity: Self { get }
    static var accuracy: Self { get }
}

extension Float: GeometricMeasure {
    public static var identity = Float(1)
    public static let accuracy = FLT_EPSILON
}

extension Double: GeometricMeasure {
    public static let identity = Double(1)
    public static let accuracy = DBL_EPSILON
}

extension CGFloat: GeometricMeasure {
    public static let identity = CGFloat(CGFloat.NativeType.identity)
    public static let accuracy = CGFloat(CGFloat.NativeType.accuracy)
}


// MARK: Approximately Equatable

public func ~==<T: GeometricMeasure>(lhs: T, rhs: T) -> Bool {
    return T.abs(rhs - lhs) <= T.accuracy
}

public func ~== <T: GeometricMeasure>(lhs: T?, rhs: T?) -> Bool {
    if let l = lhs, r = rhs {
        return l ~== r
    }
    return false
}

public func !~==<T: GeometricMeasure>(lhs: T, rhs: T) -> Bool {
    return !(lhs ~== rhs)
}

public func !~==<T: GeometricMeasure>(lhs: T?, rhs: T?) -> Bool {
    return !(lhs ~== rhs)
}

// MARK: Geometric Scaling

private func rroundBy<T: GeometricMeasure where T: Comparable>(value: T, _ scale: T = T.identity, function: T -> T) -> T {
    return (scale > T.identity) ? (function(value * scale) / scale) : function(value)
}

public func rround(value: CGFloat, scale: CGFloat = CGFloat.identity) -> CGFloat { return rroundBy(value, scale, round) }
public func rceil(value: CGFloat, scale: CGFloat = CGFloat.identity) -> CGFloat { return rroundBy(value, scale, ceil) }
public func rfloor(value: CGFloat, scale: CGFloat = CGFloat.identity) -> CGFloat { return rroundBy(value, scale, floor) }

func rceilSmart(value: CGFloat, scale: CGFloat = CGFloat.identity) -> CGFloat {
    return rroundBy(value, scale) { v in
        let vFloor = floor(v)
        if vFloor ~== v { return vFloor }
        return ceil(v)
    }
}

public extension UIView {
    
    func rround(value: CGFloat) -> CGFloat { return rroundBy(value, scale, round) }
    func rceil(value: CGFloat) -> CGFloat { return rroundBy(value, scale, ceil) }
    func rfloor(value: CGFloat) -> CGFloat { return rroundBy(value, scale, floor) }
    
}

public extension UIViewController {
    
    func rround(value: CGFloat) -> CGFloat { return rroundBy(value, view.scale, round) }
    func rceil(value: CGFloat) -> CGFloat { return rroundBy(value, view.scale, ceil) }
    func rfloor(value: CGFloat) -> CGFloat { return rroundBy(value, view.scale, floor) }
    
}
