//
//  TransferableProtocols.swift
//  TransferableContainers
//
//  Created by Tim Fuqua on 11/3/15.
//  Copyright © 2015 FuquaProductions. All rights reserved.
//

import Foundation
import UIKit

// MARK: TransferableContents
/**

*/
protocol TransferableContents {
  var longPressGestureRecognizer: UILongPressGestureRecognizer! { get set }
  var transferableController: TransferableController! { get set }
  
  func longPressGestureRecognized()
}

// MARK: TransferableController
/**

*/
protocol TransferableController {
  func contentDidStartMoving(longPress: UILongPressGestureRecognizer)
  func contentMoving(longPress: UILongPressGestureRecognizer)
  func contentDidEndMoving(longPress: UILongPressGestureRecognizer)
}
