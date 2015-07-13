import UIKit

// MARK: Assertions

func assertMainThread(file: StaticString = __FILE__, line: UWord = __LINE__) {
    assert(NSThread.isMainThread(), "This code must be called on the main thread.", file: file, line: line)
}

// MARK: Version Checking

public struct Version {
    public static let isiOS8 = floor(NSFoundationVersionNumber) > NSFoundationVersionNumber_iOS_7_1
    public static let isiOS7 = floor(NSFoundationVersionNumber) > NSFoundationVersionNumber_iOS_6_1 && !isiOS8
}

// MARK: Scaling

public func toRadians<T: GeometricMeasure where T: FloatLiteralConvertible>(value: T) -> T {
    let pi = T(floatLiteral: M_PI as! T.FloatLiteralType)
    return (value * pi) / 180.0
}

public func toDegrees<T: GeometricMeasure where T: FloatLiteralConvertible>(value: T) -> T {
    let pi = T(floatLiteral: M_PI as! T.FloatLiteralType)
    return ((value * 180.0) / pi)
}
