//
//  RoundedButton.swift
//  FrameworkTest
//
//  Created by Tim Fuqua on 1/14/15.
//  Copyright (c) 2015 FuquaProductions. All rights reserved.
//

import UIKit

public class RoundedButton: UIButton {
    
    var delegate: AlertInvoker! = nil
    
    required public init(coder decoder: NSCoder) {
        super.init(coder: decoder)
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        defaultInit()
    }
    
    public init(frame: CGRect, alertInvoker: AlertInvoker) {
        super.init(frame: frame)
        
//        delegate? = alertInvoker
        defaultInit()
    }
    
    func defaultInit() {
        layer.cornerRadius = layer.frame.height/2
        addTarget(self, action: "roundedButtonDown:", forControlEvents: UIControlEvents.TouchDown)
        addTarget(self, action: "roundedButtonUp:", forControlEvents: UIControlEvents.TouchUpInside)
    }
    
    func roundedButtonDown(sender: UIButton!) {
        
        sender.setTitleColor(UIColor.redColor(), forState: UIControlState.Normal)
    }
    
    func roundedButtonUp(sender: UIButton!) {
        
        delegate.CreateAlert("Button Pressed", message: "\(sender.titleLabel!.text) was pressed")
    }

}
