//
//  ViewController.swift
//  SwiftFactory_iOS
//
//  Created by Tim Fuqua on 11/6/14.
//  Copyright (c) 2014 FallGuySamples. All rights reserved.
//

import UIKit

//let namespace = "UIView"

typealias UIFactory = ObjectFactory<UIView>

class ViewController: UIViewController {

    func createUIObjectWithClassName(className: String!) -> NSObject? {
            
        let qualifiedName = "\(className)"
            
        let object = UIFactory.createInstance(className: qualifiedName)

        if object != nil {
            
            println("Created a \(className)")
        }
        else {
            
            println("Object Not Created")
        }
        
        return object
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // type needed to be specified to do the self.view.addSubview call below
        // figure out how to add it to the view controller's view without
        // needing to do that
        var canvas: UIView = createUIObjectWithClassName("UIView") as UIView
        canvas.frame = CGRectMake(0, 0, 200, 200)
        canvas.backgroundColor = UIColor.redColor()
        
        var label: UILabel = createUIObjectWithClassName("UILabel") as UILabel
        label.textColor = UIColor.whiteColor()
        label.backgroundColor = UIColor.blueColor()
        label.frame = CGRectMake(50, 50, 100, 50)
        label.text = "Label Text"
        
        canvas.addSubview(label)
        self.view.addSubview(canvas)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

