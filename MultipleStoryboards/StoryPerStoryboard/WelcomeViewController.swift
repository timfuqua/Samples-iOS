//
//  WelcomeViewController.swift
//  StoryPerStoryboard
//
//  Created by Milan Nankov on 10/7/14.
//  Copyright (c) 2014 myOrg. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func onViewTimelinePressed(sender: UIButton)
    {
        var storyboard = UIStoryboard(name: "timeline", bundle: nil)
        var controller = storyboard.instantiateViewControllerWithIdentifier("InitialController") as UIViewController
        
        self.presentViewController(controller, animated: true, completion: nil)
    }

    @IBAction func onFriendsViewPressed(sender: UIButton)
    {
        var storyboard = UIStoryboard(name: "friends", bundle: nil)
        var controller = storyboard.instantiateViewControllerWithIdentifier("InitialController") as UIViewController
        
        self.presentViewController(controller, animated: true, completion: nil)
    }
    
    @IBAction func onLoginPressed(sender: UIButton)
    {
        var storyboard = UIStoryboard(name: "login", bundle: nil)
        var controller = storyboard.instantiateViewControllerWithIdentifier("InitialController") as UIViewController
        
        self.presentViewController(controller, animated: true, completion: nil)
    }
}
