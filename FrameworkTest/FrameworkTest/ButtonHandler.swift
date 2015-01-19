//
//  ButtonHandler.swift
//  FrameworkTest
//
//  Created by Tim Fuqua on 1/15/15.
//  Copyright (c) 2015 FuquaProductions. All rights reserved.
//

import Foundation
import UIKit

public class ButtonHandler: AlertInvoker {
    
    var viewController: ViewController
    
    init(vc: ViewController) {
        viewController = vc
    }
    
    public func CreateAlert(title: String, message: String) {
        var pressedAlert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        
        pressedAlert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: { (action: UIAlertAction!) in
            println("Handle Ok logic here")
        }))
        
        viewController.presentViewController(pressedAlert, animated: true, completion: nil)
    }
}
