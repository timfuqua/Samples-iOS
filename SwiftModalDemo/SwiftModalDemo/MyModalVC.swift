//
//  MyModalVC.swift
//  SwiftModalDemo
//
//  Created by Tim Fuqua on 1/16/15.
//  Copyright (c) 2015 FuquaProductions. All rights reserved.
//

import UIKit

protocol MyModalDelegate{
    func myModalDidFinish(controller:MyModalVC, pie:String)
}

class MyModalVC: UIViewController {

    var delegate: MyModalDelegate! = nil
    
    @IBOutlet weak var pieChoiceLabel: UILabel!
    
    @IBAction func pieSelectionButton(sender: UIButton) {
        pieChoiceLabel.text = sender.titleLabel?.text
    }
    
    
    @IBAction func submitResultButton(sender: UIButton) {
//        dismissViewControllerAnimated(true, completion: nil)
        delegate.myModalDidFinish(self, pie: pieChoiceLabel.text!)
    }
}
