//
//  TimelineController.swift
//  MultipleStoryboards
//
//  Created by Milan Nankov on 12/10/14.
//  Copyright (c) 2014 myOrg. All rights reserved.
//

import UIKit

class TimelineController: UITableViewController
{
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    @IBAction func onBackButtonPressed(sender: AnyObject)
    {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
