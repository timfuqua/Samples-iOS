//
//  Emo.swift
//  TrieDataStructure
//
//  Created by Tim Fuqua on 6/23/19.
//  Copyright © 2019 Norswedgian Studios. All rights reserved.
//

import Foundation

protocol Emo {
    var isEmpty: Bool { get }
}

extension Emo {
    var isNotEmpty: Bool { return !isEmpty }
}

extension String: Emo {}
