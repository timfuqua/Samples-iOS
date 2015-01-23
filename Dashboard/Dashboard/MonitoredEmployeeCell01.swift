//
//  MonitoredEmployeeCell.swift
//  MonitoredEmployeeCellExample
//
//  Created by Tim Fuqua on 1/19/15.
//  Copyright (c) 2015 FuquaProductions. All rights reserved.
//

import UIKit

@IBDesignable class MonitoredEmployeeCell01: UIView {
    
    var view: UIView!

    @IBOutlet weak var paddingView: UIView!
    @IBOutlet weak var employeeName: UILabel!
    @IBOutlet weak var leftLabel1: UILabel!
    @IBOutlet weak var rightLabel1: UILabel!
    @IBOutlet weak var leftLabel2: UILabel!
    @IBOutlet weak var rightLabel2: UILabel!
    @IBOutlet weak var leftLabel3: UILabel!
    @IBOutlet weak var rightLabel3: UILabel!
    @IBOutlet weak var leftLabel4: UILabel!
    @IBOutlet weak var rightLabel4: UILabel!

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    init(coder aDecoder: NSCoder, nibName: String) {
        super.init(coder: aDecoder)
        nibSetup(nibName)
    }

    override init() {
        super.init()
        nibSetup()
    }
    
    init(nibName: String) {
        super.init()
        nibSetup(nibName)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        nibSetup()
    }
    
    init(frame: CGRect, nibName: String) {
        super.init(frame: frame)
        nibSetup(nibName)
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
    
    func nibSetup() {
        loadViewFromNib()
        view.autoresizingMask = UIViewAutoresizing.FlexibleWidth | UIViewAutoresizing.FlexibleHeight
        view.layer.cornerRadius = 20
        view.layer.borderColor = UIColor.darkGrayColor().CGColor
        view.layer.borderWidth = 2
        frame = view.frame
        bounds = view.bounds
        clearColors()
        addSubview(view)
    }
    
    func nibSetup(nibName: String) {
        loadViewFromNib(nibName)
        view.autoresizingMask = UIViewAutoresizing.FlexibleWidth | UIViewAutoresizing.FlexibleHeight
        view.layer.cornerRadius = 20
        view.layer.borderColor = UIColor.darkGrayColor().CGColor
        view.layer.borderWidth = 2
        frame = view.frame
        bounds = view.bounds
        clearColors()
        addSubview(view)
    }
    
    func loadViewFromNib() {
        let bundle = NSBundle(forClass: self.dynamicType)
        let nib = UINib(nibName: "MonitoredEmployeeCell01", bundle: bundle)
        view = nib.instantiateWithOwner(self, options: nil)[0] as UIView
    }
    
    func loadViewFromNib(nibName: String) {
        let bundle = NSBundle(forClass: self.dynamicType)
        let nib = UINib(nibName: nibName, bundle: bundle)
        view = nib.instantiateWithOwner(self, options: nil)[0] as UIView
    }
    
    func clearColors() {
        paddingView?.backgroundColor = UIColor.clearColor()
        employeeName?.backgroundColor = UIColor.clearColor()
        leftLabel1?.backgroundColor = UIColor.clearColor()
        rightLabel1?.backgroundColor = UIColor.clearColor()
        leftLabel2?.backgroundColor = UIColor.clearColor()
        rightLabel2?.backgroundColor = UIColor.clearColor()
        leftLabel3?.backgroundColor = UIColor.clearColor()
        rightLabel3?.backgroundColor = UIColor.clearColor()
        leftLabel4?.backgroundColor = UIColor.clearColor()
        rightLabel4?.backgroundColor = UIColor.clearColor()
    }
    
    func hideAllEntries() {
        leftLabel1?.hidden = true
        rightLabel1?.hidden = true
        leftLabel2?.hidden = true
        rightLabel2?.hidden = true
        leftLabel3?.hidden = true
        rightLabel3?.hidden = true
        leftLabel4?.hidden = true
        rightLabel4?.hidden = true
    }
    
    func showAllEntries() {
        leftLabel1?.hidden = false
        rightLabel1?.hidden = false
        leftLabel2?.hidden = false
        rightLabel2?.hidden = false
        leftLabel3?.hidden = false
        rightLabel3?.hidden = false
        leftLabel4?.hidden = false
        rightLabel4?.hidden = false
    }
    
    func updateData(fromEmployeeData: MonitoredEmployeeData) {
        employeeName?.text = fromEmployeeData.name

        updateLabelData(leftLabel1, text: fromEmployeeData.ACDNameString)
        updateLabelData(rightLabel1, text: fromEmployeeData.ACDName)
        updateLabelData(leftLabel2, text: fromEmployeeData.PositionString)
        updateLabelData(rightLabel2, text: fromEmployeeData.Position)
        updateLabelData(leftLabel3, text: fromEmployeeData.ACDStateString)
        updateLabelData(rightLabel3, text: fromEmployeeData.ACDState)
        updateLabelData(leftLabel4, text: fromEmployeeData.TimeInStateString)
        updateLabelData(rightLabel4, text: fromEmployeeData.TimeInState)
    }
    
    func updateData(fromCellData: CellData) {
        employeeName?.text = fromCellData.name

        updateLabelData(leftLabel1, text: fromCellData.left1)
        updateLabelData(rightLabel1, text: fromCellData.right1)
        updateLabelData(leftLabel2, text: fromCellData.left2)
        updateLabelData(rightLabel2, text: fromCellData.right2)
        updateLabelData(leftLabel3, text: fromCellData.left3)
        updateLabelData(rightLabel3, text: fromCellData.right3)
        updateLabelData(leftLabel4, text: fromCellData.left4)
        updateLabelData(rightLabel4, text: fromCellData.right4)
    }
    
    func updateLabelData(label: UILabel?, text: String?) {
        label?.text = text
        if text? != nil {
            label?.hidden = false
        }
        else {
            label?.hidden = true
        }
    }
    
}
