//
//  ViewController.swift
//  SampleUIObjects
//
//  Created by Tim Fuqua on 11/3/14.
//  Copyright (c) 2014 FallGuySamples. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let canvas = UIView(frame: CGRectMake(0, 0, 200, 200))
        canvas.backgroundColor = UIColor.blueColor()
        
        let title = UILabel(frame: CGRectMake(50, 50, 100, 20))
        title.text = "My Title"
        title.textColor = UIColor.whiteColor()
        title.textAlignment = NSTextAlignment.Center
        
        let button = UIButton(frame: CGRectMake(50, 100, 100, 50))
        button.backgroundColor = UIColor.whiteColor()
        button.setTitle("My Button", forState: UIControlState.Normal)
        button.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        
        button.layer.cornerRadius = 10
        button.layer.shadowColor = UIColor.blackColor().CGColor
        button.layer.shadowOpacity = 0.1
        button.layer.shadowOffset = CGSizeMake(10, 10)
        button.layer.shadowRadius = 10
        
        canvas.addSubview(button)
        canvas.addSubview(title)
        
        self.view.addSubview(canvas)
    }

}

