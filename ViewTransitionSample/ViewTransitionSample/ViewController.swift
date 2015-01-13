//
//  ViewController.swift
//  ViewTransitionSample
//
//  Created by Tim Fuqua on 11/12/14.
//  Copyright (c) 2014 FallGuySamples. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var mainView: UIView!
    @IBOutlet weak var swappingViews: UIView!
    var view1: UIView?
    var view2: UIView?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.setUpView()
    }

    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setUpView() {
        
        self.view.setNeedsLayout()
        self.view.layoutIfNeeded()
        
        self.mainView.backgroundColor = UIColor.greenColor()
        
        self.view1 = UIView(frame: self.swappingViews.bounds)
        self.view1!.backgroundColor = UIColor.purpleColor()
        
        self.view2 = UIView(frame: self.swappingViews.bounds)
        self.view2!.backgroundColor = UIColor.orangeColor()
        
//        self.mainView.addSubview(view1!)
//        self.mainView.sendSubviewToBack(view1!)
        self.swappingViews.addSubview(view1!)
        self.swappingViews.bringSubviewToFront(view1!)
        
        printDetails()
    }
    
    func doTransitionWithOption(animationTransitionOption: UIViewAnimationOptions) {
        
        
        if view2?.isDescendantOfView(self.swappingViews) == true {
            
            println("Swapping from view2 to view1")
            printDetails()
            
            UIView.transitionFromView(view2!, toView: view1!,
                duration: 2, options: animationTransitionOption,
                completion: {
                    (value: Bool) in
                    self.view2!.removeFromSuperview()
            })
            
            self.swappingViews.addSubview(view1!)
            self.swappingViews.bringSubviewToFront(view1!)
        }
        else if view1?.isDescendantOfView(self.swappingViews) == true {
            
            println("Swapping from view1 to view2")
            printDetails()
            
            UIView.transitionFromView(view1!, toView: view2!,
                duration: 2, options: animationTransitionOption,
                completion: {
                    (value: Bool) in
                    self.view1!.removeFromSuperview()
            })

            self.swappingViews.addSubview(view2!)
            self.swappingViews.bringSubviewToFront(view2!)
        }
        else {
            
            println("Well that's unexpected")
        }
    }
    
    func printDetails() {
        
        println(self.swappingViews.bounds)
        println(self.swappingViews.frame)
        
        println("view1 details:")
        println(self.view1)
        println("view2 details:")
        println(self.view2)
        println("swappingViews has \(self.swappingViews.subviews.count) subviews")
        
        for child in self.swappingViews.subviews {
            
            println("swappingViews child details:")
            println(child)
        }
    }

    @IBAction func doTransition(sender: UIButton) {
        
        doTransitionWithOption(UIViewAnimationOptions.TransitionFlipFromLeft)
    }
}

