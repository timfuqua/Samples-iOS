//
//  ViewController.swift
//  FrameworkTest
//
//  Created by Tim Fuqua on 1/14/15.
//  Copyright (c) 2015 FuquaProductions. All rights reserved.
//

import UIKit
import MyCustomViews

class ViewController: UIViewController {

    var buttonHandler: ButtonHandler! = nil
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init() {
        super.init()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        buttonHandler = ButtonHandler(vc: self)
        
        var button: RoundedButton = RoundedButton(frame: CGRect(x: 50, y: 50, width: 150, height: 50))
        button.delegate = buttonHandler
        button.setTitle("Rounded Button", forState: UIControlState.Normal)
        button.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        button.backgroundColor = UIColor.blueColor()
        
        view.addSubview(button)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

