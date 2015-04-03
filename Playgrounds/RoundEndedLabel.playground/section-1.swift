// Playground - noun: a place where people can play

import UIKit

class RoundedLabel: UILabel {
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    self.layer.masksToBounds = true
    self.layer.cornerRadius = self.frame.size.height / 2.0
  }

  required init(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}

let roundedLabel = RoundedLabel(frame: CGRectMake(0, 0, 200, 50))
roundedLabel.text = "Rounded Label"
roundedLabel.backgroundColor = UIColor.blueColor()
roundedLabel.textAlignment = .Center
//roundedLabel.layer.masksToBounds = true
//roundedLabel.layer.cornerRadius = roundedLabel.frame.size.height / 2.0
//
roundedLabel

