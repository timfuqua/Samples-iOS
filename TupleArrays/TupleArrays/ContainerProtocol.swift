//
//  ContainerProtocol.swift
//  TupleArrays
//
//  Created by Tim Fuqua on 2/2/15.
//  Copyright (c) 2015 FuquaProductions. All rights reserved.
//

protocol Container {
    
    typealias ItemType
    
    mutating func append(item: ItemType)
    var count: Int { get }
    subscript(i: Int) -> ItemType { get }
}
