//
//  Path.swift
//  DijkstrasAlgorithm
//
//  Created by Tim Fuqua on 6/24/19.
//  Copyright © 2019 Norswedgian Studios. All rights reserved.
//

import Foundation

func == <T>(lhs: Path<T>, rhs: Path<T>) -> Bool {
    let isCumulativeWeightEqual = lhs.cumulativeWeight == rhs.cumulativeWeight
//    let isNodeEqual = lhs.node == rhs.node
    var isPreviousPathEqual = true
    
    if let lhsPreviousPath = lhs.previousPath, let rhsPreviousPath = rhs.previousPath {
        isPreviousPathEqual = lhsPreviousPath == rhsPreviousPath
    }
    
    return isCumulativeWeightEqual
//        && isNodeEqual
        && isPreviousPathEqual
}

func < <T>(lhs: Path<T>, rhs: Path<T>) -> Bool {
    return lhs.cumulativeWeight < rhs.cumulativeWeight
}

class Path<T: Hashable>: Comparable {
    
    let cumulativeWeight: Int
    let node: Node<T>
    let previousPath: Path<T>?
    
    init(to node: Node<T>, via connection: Connection<T>? = nil, previousPath: Path<T>? = nil) {
        if let previousPath = previousPath, let viaConnection = connection {
            cumulativeWeight = viaConnection.weight + previousPath.cumulativeWeight
        } else {
            cumulativeWeight = 0
        }
        
        self.node = node
        self.previousPath = previousPath
    }
    
}

extension Path {
    var asArray: [Node<T>] {
        var array: [Node<T>] = [node]
        var iterativePath = self
        
        while let path = iterativePath.previousPath {
            array.append(path.node)
            iterativePath = path
        }
        
        return array
    }
}
