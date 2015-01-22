//
//  MonitoredEmployeeCell.swift
//  MonitoredEmployeeCellExample
//
//  Created by Tim Fuqua on 1/19/15.
//  Copyright (c) 2015 FuquaProductions. All rights reserved.
//

import UIKit

@IBDesignable class MonitoredEmployeeCell02: UIView {
    
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
        addSubview(view)
    }
    
    func loadViewFromNib() {
        let bundle = NSBundle(forClass: self.dynamicType)
        let nib = UINib(nibName: "MonitoredEmployeeCell02", bundle: bundle)
        view = nib.instantiateWithOwner(self, options: nil)[0] as UIView
//        let frameRect = view.frame
//        let boundsRect = view.bounds
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
    
    
}
