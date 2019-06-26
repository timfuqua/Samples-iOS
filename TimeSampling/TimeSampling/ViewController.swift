//
//  ViewController.swift
//  TimeSampling
//
//  Created by Tim Fuqua on 6/25/19.
//  Copyright © 2019 Norswedgian Studios. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let data = [
        CGPoint(x: 1.2, y: 13)
        , CGPoint(x: 2.0, y: 23)
        , CGPoint(x: 2.1, y: 27)
        , CGPoint(x: 3.9, y: 35)
        , CGPoint(x: 4.7, y: 40)
        , CGPoint(x: 6.5, y: 41)
        , CGPoint(x: 6.9, y: 58)
        , CGPoint(x: 8.3, y: 69)
        , CGPoint(x: 8.7, y: 78)
        , CGPoint(x: 9.3, y: 94)
    ]
    
    var firstTwoDataPoints: [CGPoint]?
    var lastTwoDataPoints: [CGPoint]?
    
    var closestMapping: [Int: [CGPoint]] = [:]

}

// MARK:- lifecycle
extension ViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        initializeClosestMapping()
        initializeFirstTwoPoints()
        initializeLastTwoPoints()
        
        for key in closestMapping.keys.sorted() {
            if let closestMappings = closestMapping[key] {
                print("closestMappings for \(key): \(closestMappings)")
            }
        }
        
//        if let keyBelow2 = closestKey(below: 2) {
//            print("keyBelow2: \(keyBelow2)")
//        } else {
//            print("keyBelow2: DNE")
//        }
//
//        if let keyBelow6 = closestKey(below: 6) {
//            print("keyBelow6: \(keyBelow6)")
//        } else {
//            print("keyBelow6: DNE")
//        }
//
//        if let keyBelow1 = closestKey(below: 1) {
//            print("keyBelow1: \(keyBelow1)")
//        } else {
//            print("keyBelow1: DNE")
//        }
//
//        if let keyAbove3 = closestKey(above: 3) {
//            print("keyAbove3: \(keyAbove3)")
//        } else {
//            print("keyAbove3: DNE")
//        }
//
//        if let keyAbove4 = closestKey(above: 4) {
//            print("keyAbove4: \(keyAbove4)")
//        } else {
//            print("keyAbove4: DNE")
//        }
//
//        if let keyAbove9 = closestKey(above: 9) {
//            print("keyAbove9: \(keyAbove9)")
//        } else {
//            print("keyAbove9: DNE")
//        }
        
        for i in 0..<12 {
            if let value = timeSampledValue(at: i) {
                print("timeSampledValue(at: \(i)): \(value)")
            } else {
                print("timeSampledValue(at: \(i)): DNE")
            }
        }
        
    }
}

// MARK:- helpers
extension ViewController {
    private func initializeFirstTwoPoints() {
        firstTwoDataPoints = data
        if firstTwoDataPoints != nil && firstTwoDataPoints!.count > 1 {
            firstTwoDataPoints!.removeSubrange(2..<data.count)
            print("firstTwoDataPoints: \(firstTwoDataPoints!)")
        }
    }
    
    private func initializeLastTwoPoints() {
        lastTwoDataPoints = data
        if lastTwoDataPoints != nil && lastTwoDataPoints!.count > 1 {
            lastTwoDataPoints!.removeSubrange(0..<data.count-2)
            print("lastTwoDataPoints: \(lastTwoDataPoints!)")
        }
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
//        guard closestMapping.keys.contains(index)
        
        var points: [CGPoint] = []
//        var firstPoint: CGPoint
//        var secondPoint: CGPoint

        if let belowKey = closestKey(below: interval), let belowValues = closestMapping[belowKey], let justBelow = belowValues.last {
//            print("belowKey: \(belowKey)")
//            print("belowValues: \(belowValues)")
//            print("justBelow: \(justBelow)")
            points.append(justBelow)
        } else {
//            var firstTwoDataPoints = data
//            firstTwoDataPoints.removeSubrange(0..<2)
            points = firstTwoDataPoints ?? []
        }
        
        if points.count < 2 {
            if let aboveKey = closestKey(above: interval-1), let aboveValues = closestMapping[aboveKey], let justAbove = aboveValues.first {
                //            print("aboveKey: \(aboveKey)")
                //            print("aboveValues: \(aboveValues)")
                //            print("justAbove: \(justAbove)")
                points.append(justAbove)
            } else {
                points = lastTwoDataPoints ?? []
            }
        }
        
//        print("points: \(points)")
        
        guard points.count == 2 else { return nil }
        guard let first = points.first, let second = points.last else { return nil }
        
        return pointRelativeTo(firstPoint: first, secondPoint: second, offset: interval)
    }
}

