//
//  MonitoredEmployeeCell.swift
//  MonitoredEmployeeCellExample
//
//  Created by Tim Fuqua on 1/19/15.
//  Copyright (c) 2015 FuquaProductions. All rights reserved.
//

import UIKit

@IBDesignable class MonitoredEmployeeCell03: UIView {
    
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
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        nibSetup()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        nibSetup()
    }

    override init() {
        super.init()
        nibSetup()
    }
    
    func nibSetup() {
        loadViewFromNib()
        view.autoresizingMask = UIViewAutoresizing.FlexibleWidth | UIViewAutoresizing.FlexibleHeight
        view.layer.cornerRadius = 20
        view.layer.borderColor = UIColor.darkGrayColor().CGColor
        view.layer.borderWidth = 2
        frame = view.frame
        bounds = view.bounds
        
        hideAll()
        
        addSubview(view)
    }
    
    func loadViewFromNib() {
        let bundle = NSBundle(forClass: self.dynamicType)
        let nib = UINib(nibName: "MonitoredEmployeeCell03", bundle: bundle)
        view = nib.instantiateWithOwner(self, options: nil)[0] as UIView
//        let frameRect = view.frame
//        let boundsRect = view.bounds
    }
    
    func hideAll() {
//        employeeName?.hidden = true
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
//        employeeName?.hidden = false
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

        ACDStateData?.text = fromCellData.left1
        if fromCellData.left1? != nil {
            ACDStateData?.hidden = false
        }
        else {
            ACDStateData?.hidden = true
        }
        
        TimeInStateData?.text = fromCellData.right1
        if fromCellData.right1? != nil {
            TimeInStateData?.hidden = false
        }
        else {
            TimeInStateData?.hidden = true
        }

    }
    
}
