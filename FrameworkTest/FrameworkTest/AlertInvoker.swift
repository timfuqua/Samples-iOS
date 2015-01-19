//
//  AlertInvoker.swift
//  FrameworkTest
//
//  Created by Tim Fuqua on 1/15/15.
//  Copyright (c) 2015 FuquaProductions. All rights reserved.
//

import Foundation

public protocol AlertInvoker {
    func CreateAlert(title: String, message: String)
}
