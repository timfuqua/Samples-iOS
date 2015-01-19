//
//  ViewController.swift
//  MonitoredEmployeeCellExample
//
//  Created by Tim Fuqua on 1/15/15.
//  Copyright (c) 2015 FuquaProductions. All rights reserved.
//

import UIKit



class ViewController: UIViewController {

    @IBOutlet weak var FirstEmployeeView: UIView!

    @IBOutlet weak var NameLabel: UILabel!
    @IBOutlet weak var ACDNameLabel: UILabel!
    @IBOutlet weak var PositionLabel: UILabel!
    @IBOutlet weak var ACDStateLabel: UILabel!
    @IBOutlet weak var TimeInStateLabel: UILabel!
    
    @IBOutlet weak var secondEmployeeCell: MonitoredEmployeeCell!
    var thirdEmployeeCell: MonitoredEmployeeCell?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var firstEmployee: MonitoredEmployeeData = MonitoredEmployeeData(name: "Julie Andrews", acdName: "ACDOUT", position: "2030758", acdState: "ACDOUT", timeInState: "05:46:05")
        var secondEmployee: MonitoredEmployeeData = MonitoredEmployeeData(name: "Sam Smith", acdName: "ACW", position: "2030729", acdState: "ACW", timeInState: "02:30:02")
        var thirdEmployee: MonitoredEmployeeData = MonitoredEmployeeData(name: "John Andrews", acdName: "HOLD", position: "2030475", acdState: "HOLD", timeInState: "01:46:08")

        FirstEmployeeView.layer.cornerRadius = 20
        FirstEmployeeView.layer.borderColor = UIColor.darkGrayColor().CGColor
        FirstEmployeeView.layer.borderWidth = 2

        setEmployeeData(firstEmployee)
//        setEmployeeData(secondEmployee)
        
        secondEmployeeCell.updateData(secondEmployee)
        
//        let layerFrame: CGRect = secondEmployeeCell.view.layer.frame
//        let viewFrame: CGRect = secondEmployeeCell.view.frame
//        let layerBounds: CGRect = secondEmployeeCell.view.layer.bounds
//        let viewBounds: CGRect = secondEmployeeCell.view.bounds
        let width: CGFloat = CGFloat(secondEmployeeCell.view.layer.frame.width)
        let height: CGFloat = CGFloat(secondEmployeeCell.view.layer.frame.height)
//        let x: CGFloat = CGFloat(secondEmployeeCell.view.layer.frame.origin.x + width + 25.0)
//        let y: CGFloat = CGFloat(secondEmployeeCell.view.layer.frame.origin.y)
        let x: CGFloat = CGFloat(50.0 + width + 25.0 + width + 25.0)
        let y: CGFloat = CGFloat(50.0)
        
//        thirdEmployeeCell = MonitoredEmployeeCell(frame: CGRect(x: CGFloat(secondEmployeeCell.view.layer.frame.origin.x + 25.0), y: CGFloat(secondEmployeeCell.view.layer.frame.origin.y), width: CGFloat(secondEmployeeCell.view.layer.frame.width), height: CGFloat(secondEmployeeCell.view.layer.frame.height)))
        thirdEmployeeCell = MonitoredEmployeeCell(frame: CGRect(x: x, y: y, width: width, height: height))
        self.view.addSubview(thirdEmployeeCell!)
        thirdEmployeeCell!.updateData(thirdEmployee)
        
//        NameLabel.text = firstEmployee.name
//        ACDNameLabel.text = firstEmployee.ACDName
//        PositionLabel.text = firstEmployee.Position
//        ACDStateLabel.text = firstEmployee.ACDState
//        TimeInStateLabel.text = firstEmployee.TimeInState
        
//        var secondEmpoyeeView: UIView = UIView(frame: CGRect(x: 50, y: 50, width: 200, height: 200))
//        secondEmpoyeeView.backgroundColor = UIColor.lightGrayColor()
//        secondEmpoyeeView.layer.cornerRadius = 20
//        secondEmpoyeeView.layer.borderColor = UIColor.darkGrayColor().CGColor
//        secondEmpoyeeView.layer.borderWidth = 2
//        
//        self.view.addSubview(secondEmpoyeeView)
//        
//        var nameLabel: UILabel = UILabel(frame: CGRect(x: 10, y: 20, width: secondEmpoyeeView.layer.frame.width - 20, height: 25))
//        nameLabel.font = UIFont(name: "HelveticaNeue", size: 20)
//        nameLabel.text = firstEmployee.name
//        nameLabel.textColor = UIColor.blueColor()
//        
//        var acdStringLabel: UILabel = UILabel(frame: CGRect(x: 10, y: 50, width: secondEmpoyeeView.layer.frame.width - 20, height: 50))
//        acdStringLabel.font = UIFont(name: "HelveticaNeue", size: 15)
//        acdStringLabel.text = firstEmployee.ACDNameString
//        acdStringLabel.textColor = UIColor.blueColor()
//        
//        secondEmpoyeeView.addSubview(nameLabel)
        
//        createEmployeeCell(50, yOffset: 50, employeeData: secondEmployee, inView: self.view)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func setEmployeeData(employee: MonitoredEmployeeData) {
        NameLabel.text = employee.name
        ACDNameLabel.text = employee.ACDName
        PositionLabel.text = employee.Position
        ACDStateLabel.text = employee.ACDState
        TimeInStateLabel.text = employee.TimeInState
    }
    
    func createEmployeeCell(xOffset: Int, yOffset: Int, employeeData: MonitoredEmployeeData, inView: UIView) {
        
        var employeeCellView: UIView = createEmployeeCellView(xOffset, yOffset: yOffset)
        
        inView.addSubview(employeeCellView)
    }
    
    private func createEmployeeCellView(xOffset: Int, yOffset: Int) -> UIView {
        var employeeCellView: UIView = UIView(frame: CGRect(x: xOffset, y: yOffset, width: 250, height: 200))
        employeeCellView.backgroundColor = UIColor.lightGrayColor()
        employeeCellView.layer.cornerRadius = 20
        employeeCellView.layer.borderColor = UIColor.darkGrayColor().CGColor
        employeeCellView.layer.borderWidth = 2
        
        return employeeCellView
    }
    
    private func createEmployeeCellNameLabel(inEmployeeCellView: UIView, xOffset: Int, yOffset: Int, name: String) {
        var nameLabel: UILabel = UILabel(frame: CGRect(x: Int(xOffset), y: Int(20), width: Int(inEmployeeCellView.layer.frame.width - 30), height: Int(25)))
        nameLabel.font = UIFont(name: "HelveticaNeue", size: 20)
        nameLabel.textColor = UIColor.blueColor()
        nameLabel.text = name
        
        inEmployeeCellView.addSubview(nameLabel)
    }
    
    private func createEmployeeCellInfoLabels(inEmployeeCellView: UIView, xOffset: Int, yOffset: Int, left: String, right: String) {
        //        var leftLabel: UILabel =
    }
}

