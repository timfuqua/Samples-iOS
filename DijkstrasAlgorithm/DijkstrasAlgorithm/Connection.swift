//
//  Connection.swift
//  DijkstrasAlgorithm
//
//  Created by Tim Fuqua on 6/24/19.
//  Copyright © 2019 Norswedgian Studios. All rights reserved.
//

import Foundation

class Connection<T: Hashable> {
    
    let to: Node<T>
    let weight: Int
    
    init(to: Node<T>, weight: Int) {
        assert(weight > 0)
        self.to = to
        self.weight = weight
    }
    
}
