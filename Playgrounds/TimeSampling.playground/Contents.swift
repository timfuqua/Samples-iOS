import UIKit

let data = [
    CGPoint(x: 1.2, y: 13)
    , CGPoint(x: 2.0, y: 23)
    , CGPoint(x: 2.1, y: 27)
    , CGPoint(x: 3.9, y: 35)
    , CGPoint(x: 6.5, y: 41)
    , CGPoint(x: 6.7, y: 49)
    , CGPoint(x: 6.9, y: 58)
    , CGPoint(x: 8.3, y: 69)
    , CGPoint(x: 8.7, y: 78)
    , CGPoint(x: 9.3, y: 94)
]

var firstTwoDataPoints: [CGPoint]?
var lastTwoDataPoints: [CGPoint]?

var closestMapping: [Int: [CGPoint]] = [:]

private func initializeFirstTwoPoints() {
    guard data.count > 1 else { return }
    firstTwoDataPoints = data
    firstTwoDataPoints!.removeSubrange(2..<data.count)
}

private func initializeLastTwoPoints() {
    guard data.count > 1 else { return }
    lastTwoDataPoints = data
    lastTwoDataPoints!.removeSubrange(0..<data.count-2)
}

private func initializeClosestMapping() {
    for point in data {
        let key = Int(floor(point.x))
        if let points = closestMapping[key] {
            closestMapping[key] = points + [point]
        } else {
            closestMapping[key] = [point]
        }
    }
}

initializeClosestMapping()
initializeFirstTwoPoints()
initializeLastTwoPoints()

private func closestKey(below index: Int) -> Int? {
    guard index >= 0 else { return nil }
    
    var belowIndex: Int?
    
    for key in closestMapping.keys.sorted() {
        if key < index {
            belowIndex = key
        } else {
            return belowIndex
        }
    }
    
    return belowIndex
}

private func closestKey(above index: Int) -> Int? {
    guard index >= 0 else { return nil }
    
    var aboveIndex: Int?
    
    for key in closestMapping.keys.sorted().reversed() {
        if key > index {
            aboveIndex = key
        } else {
            return aboveIndex
        }
    }
    
    return aboveIndex
}

private func pointRelativeTo(firstPoint first: CGPoint, secondPoint second: CGPoint, offset: Int) -> CGPoint {
    let relativeOffsetX = CGFloat(offset) - first.x
    let deltaX = second.x - first.x
    let deltaY = second.y - first.y
    
    return CGPoint(x: CGFloat(offset), y: first.y + (relativeOffsetX/deltaX)*deltaY)
}

private func timeSampledValue(at interval: Int) -> CGPoint? {
    guard interval >= 0 else { return nil }
    guard closestMapping.isEmpty == false else { return nil }
    guard closestMapping.count > 1 else { return closestMapping.first?.value.first }
    
    var points: [CGPoint] = []
    
    if let belowKey = closestKey(below: interval), let belowValues = closestMapping[belowKey], let justBelow = belowValues.last {
        points.append(justBelow)
    } else {
        points = firstTwoDataPoints ?? []
    }
    
    if points.count < 2 {
        if let aboveKey = closestKey(above: interval-1), let aboveValues = closestMapping[aboveKey], let justAbove = aboveValues.first {
            points.append(justAbove)
        } else {
            points = lastTwoDataPoints ?? []
        }
    }
    
    guard points.count == 2 else { return nil }
    guard let first = points.first, let second = points.last else { return nil }
    
    return pointRelativeTo(firstPoint: first, secondPoint: second, offset: interval)
}

for i in 0..<12 {
    if let value = timeSampledValue(at: i) {
        print("timeSampledValue(at: \(i)): \(value)")
    }
}

