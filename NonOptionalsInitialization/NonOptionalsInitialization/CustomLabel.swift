//
//  CustomLabel.swift
//  NonOptionalsInitialization
//
//  Created by Tim Fuqua on 2/10/15.
//  Copyright (c) 2015 SOQuestions. All rights reserved.
//

import UIKit
import QuartzCore


class CustomLabel: UILabel {

  lazy var customLayer: CALayer = {
    var layer = CALayer()
    layer.backgroundColor = UIColor.greenColor().CGColor
    layer.borderWidth = 5.0
    layer.borderColor = UIColor.blueColor().CGColor
    layer.hidden = true
    return layer
  }()
  
  required init(coder aDecoder: NSCoder) {
    fatalError("NSCoding not supported")
  }
  
  override init(frame: CGRect) {

    super.init(frame: frame)
    layer.addSublayer(customLayer)
  }
  
}
