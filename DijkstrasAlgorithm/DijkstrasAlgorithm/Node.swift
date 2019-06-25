//
//  Node.swift
//  DijkstrasAlgorithm
//
//  Created by Tim Fuqua on 6/24/19.
//  Copyright © 2019 Norswedgian Studios. All rights reserved.
//

import Foundation



class Node<T: Hashable>: Hashable {
    static func == (lhs: Node<T>, rhs: Node<T>) -> Bool {
        return lhs.value == rhs.value
    }
    
    var value: T
    
//    var visited: Bool = false
    var connections: [Connection<T>] = []
    
    init(value: T) {
        self.value = value
    }
    
}

extension Node {
    var hashValue: Int { return value.hashValue }
}
