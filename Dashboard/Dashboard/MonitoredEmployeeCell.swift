//
//  MonitoredEmployeeCell.swift
//  MonitoredEmployeeCellExample
//
//  Created by Tim Fuqua on 1/19/15.
//  Copyright (c) 2015 FuquaProductions. All rights reserved.
//

import UIKit

@IBDesignable class MonitoredEmployeeCell: UIView {
    
    var view: UIView!

    @IBOutlet weak var employeeName: UILabel!
    @IBOutlet weak var ACDNameString: UILabel!
    @IBOutlet weak var ACDNameData: UILabel!
    @IBOutlet weak var PositionString: UILabel!
    @IBOutlet weak var PositionData: UILabel!
    @IBOutlet weak var ACDStateString: UILabel!
    @IBOutlet weak var ACDStateData: UILabel!
    @IBOutlet weak var TimeInStateString: UILabel!
    @IBOutlet weak var TimeInStateData: UILabel!

    required init(coder aDecoder: NSCoder, nibName:String) {
        super.init(coder: aDecoder)
        nibSetup(nibName)
    }
    
    init(frame: CGRect, nibName:String) {
        super.init(frame: frame)
        nibSetup(nibName)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init(nibName:String) {
        super.init()
        nibSetup(nibName)
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    @IBAction func openDetailInfo(sender: AnyObject) {
        //        var popoverContent = storyboard.instantiateViewControllerWithIdentifier("NewCategory") as UIViewController
        //        var nav = UINavigationController(rootViewController: popoverContent)
        //        nav.modalPresentationStyle = UIModalPresentationStyle.Popover
        //        var popover = nav.popoverPresentationController
        //        popoverContent.preferredContentSize = CGSizeMake(500,600)
        //        popover.delegate = self
        //        popover.sourceView = self.view
        //        popover.sourceRect = CGRectMake(100,100,0,0)
        //
        //        self.presentViewController(nav, animated: true, completion: nil)
        println("button clicked")
    }
    
    func nibSetup(nibName:String) {
        loadViewFromNib(nibName)
        //        view.frame = bound
        view.autoresizingMask = UIViewAutoresizing.FlexibleWidth | UIViewAutoresizing.FlexibleHeight
        view.layer.cornerRadius = 20
        view.layer.borderColor = UIColor.darkGrayColor().CGColor
        view.layer.borderWidth = 2
        self.frame = view.frame
        self.bounds = view.bounds
        addSubview(view)
    }
    
    func loadViewFromNib(nibName:String) {
        let bundle = NSBundle(forClass: self.dynamicType)
        let nib = UINib(nibName: nibName, bundle: bundle)
        view = nib.instantiateWithOwner(self, options: nil)[0] as UIView
        //        let frameRect = view.frame
        //        let boundsRect = view.bounds
    }
    
    func hideAll() {
        ACDNameString?.hidden = true
        ACDNameData?.hidden = true
        PositionString?.hidden = true
        PositionData?.hidden = true
        ACDStateString?.hidden = true
        ACDStateData?.hidden = true
        TimeInStateString?.hidden = true
        TimeInStateData?.hidden = true
    }
    
    func showAll() {
        ACDNameString?.hidden = false
        ACDNameData?.hidden = false
        PositionString?.hidden = false
        PositionData?.hidden = false
        ACDStateString?.hidden = false
        ACDStateData?.hidden = false
        TimeInStateString?.hidden = false
        TimeInStateData?.hidden = false
    }
    
    func updateData(fromEmployeeData: MonitoredEmployeeData) {
        employeeName?.text = fromEmployeeData.name
        ACDNameString?.text = fromEmployeeData.ACDNameString
        ACDNameData?.text = fromEmployeeData.ACDName
        PositionString?.text = fromEmployeeData.PositionString
        PositionData?.text = fromEmployeeData.Position
        ACDStateString?.text = fromEmployeeData.ACDStateString
        ACDStateData?.text = fromEmployeeData.ACDState
        TimeInStateString?.text = fromEmployeeData.TimeInStateString
        TimeInStateData?.text = fromEmployeeData.TimeInState
    }
    
    func updateData(fromCellData: CellData) {
        employeeName?.text = fromCellData.name
        
        ACDNameString?.text = fromCellData.left1
        if fromCellData.left1? != nil {
            ACDNameString?.hidden = false
        }
        else {
            ACDNameString?.hidden = true
        }
        
        ACDNameData?.text = fromCellData.right1
        if fromCellData.right1? != nil {
            ACDNameData?.hidden = false
        }
        else {
            ACDNameData?.hidden = true
        }
        
        PositionString?.text = fromCellData.left2
        if fromCellData.left2? != nil {
            PositionString?.hidden = false
        }
        else {
            PositionString?.hidden = true
        }
        
        PositionData?.text = fromCellData.right2
        if fromCellData.right2? != nil {
            PositionData?.hidden = false
        }
        else {
            PositionData?.hidden = true
        }
        
        ACDStateString?.text = fromCellData.left3
        if fromCellData.left3? != nil {
            ACDStateString?.hidden = false
        }
        else {
            ACDStateString?.hidden = true
        }
        
        ACDStateData?.text = fromCellData.right3
        if fromCellData.right3? != nil {
            ACDStateData?.hidden = false
        }
        else {
            ACDStateData?.hidden = true
        }
        
        TimeInStateString?.text = fromCellData.left4
        if fromCellData.left4? != nil {
            TimeInStateString?.hidden = false
        }
        else {
            TimeInStateString?.hidden = true
        }
        
        TimeInStateData?.text = fromCellData.right4
        if fromCellData.right4? != nil {
            TimeInStateData?.hidden = false
        }
        else {
            TimeInStateData?.hidden = true
        }
    }
    
}
