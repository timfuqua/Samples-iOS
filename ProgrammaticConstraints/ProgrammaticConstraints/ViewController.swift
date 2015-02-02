//
//  ViewController.swift
//  ProgrammaticConstraints
//
//  Created by Tim Fuqua on 1/30/15.
//  Copyright (c) 2015 FuquaProductions. All rights reserved.
//
//  http://makeapppie.com/2014/07/26/the-swift-swift-tutorial-how-to-use-uiviews-with-auto-layout-programmatically/
//

import UIKit

class ViewController: UIViewController {

    let button1 = UIButton.buttonWithType(UIButtonType.System) as UIButton
    let label1 = UILabel() as UILabel
    let atRest = "Doesn't do much"
    let atWork = "Secret Agent"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 1, alpha: 1)
        makeLayout()
    }

    override func supportedInterfaceOrientations() -> Int {
        return Int(UIInterfaceOrientationMask.All.rawValue)
    }
    
    func makeLayout() {
        let view1 = UIView()
        view1.setTranslatesAutoresizingMaskIntoConstraints(false)
        view1.backgroundColor = UIColor.redColor()
        
        let view2 = UIView()
        view2.setTranslatesAutoresizingMaskIntoConstraints(false)
        view2.backgroundColor = UIColor(red: 0.75, green: 0.75, blue: 0.1, alpha: 1.0)
        
        view.addSubview(view1)
        view.addSubview(view2)
        
        let viewsDictionary = ["view1": view1, "view2": view2]
        let metricsDictionary = ["view1Height": 50.0, "view2Height": 40.0, "viewWidth": 100.0]
        
        let view1_constraint_H: Array = NSLayoutConstraint.constraintsWithVisualFormat("H:[view1(viewWidth)]", options: NSLayoutFormatOptions(0), metrics: metricsDictionary, views: viewsDictionary)
        let view1_constraint_V: Array = NSLayoutConstraint.constraintsWithVisualFormat("V:[view1(view1Height)]", options: NSLayoutFormatOptions(0), metrics: metricsDictionary, views: viewsDictionary)
        
        view1.addConstraints(view1_constraint_H)
        view1.addConstraints(view1_constraint_V)
        
        let view2_constraint_H: Array = NSLayoutConstraint.constraintsWithVisualFormat("H:[view2(viewWidth)]", options: NSLayoutFormatOptions(0), metrics: metricsDictionary, views: viewsDictionary)
        let view2_constraint_V: Array = NSLayoutConstraint.constraintsWithVisualFormat("V:[view2(>=view2Height)]", options: NSLayoutFormatOptions(0), metrics: metricsDictionary, views: viewsDictionary)
        
        view2.addConstraints(view2_constraint_H)
        view2.addConstraints(view2_constraint_V)
        
        let view_constraint_H: Array = NSLayoutConstraint.constraintsWithVisualFormat("H:|-[view2]", options: NSLayoutFormatOptions(0), metrics: nil, views: viewsDictionary)
        let view_constraint_V: Array = NSLayoutConstraint.constraintsWithVisualFormat("V:|-36-[view1]-[view2]-0-|", options: NSLayoutFormatOptions.AlignAllLeading, metrics: nil, views: viewsDictionary)
        
        view.addConstraints(view_constraint_H)
        view.addConstraints(view_constraint_V)
    }
}

