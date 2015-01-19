//
//  ViewController.swift
//  SwiftModalDemo
//
//  Created by Tim Fuqua on 1/16/15.
//  Copyright (c) 2015 FuquaProductions. All rights reserved.
//

import UIKit

class ViewController: UIViewController, MyModalDelegate {
    
    let pieVC = MyModalVC(nibName: "MyModalVC", bundle: nil)

    @IBOutlet weak var statusLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func myModalDidFinish(controller: MyModalVC, pie: String) {
        statusLabel.text = pie + " pie"
        controller.dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func myModalButton(sender: UIButton) {
        pieVC.delegate = self
        pieVC.modalTransitionStyle = UIModalTransitionStyle.PartialCurl
        presentViewController(pieVC, animated: true, completion: nil)
    }

}

