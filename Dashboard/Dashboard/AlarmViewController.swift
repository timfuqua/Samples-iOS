//
//  AlarmViewController.swift
//  Dashboard
//
//  Created by stephen zhou on 1/16/15.
//  Copyright (c) 2015 stephen zhou. All rights reserved.
//

import UIKit

private let reuseIdentifier = "AlarmCell"
var demo = DemoData()

class AlarmViewController: UICollectionViewController {
    
//    var employeeCell: MonitoredEmployeeCell?
    var employeeCell: MonitoredEmployeeCell01?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Register cell classes
        self.collectionView!.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        //#warning Incomplete method implementation -- Return the number of sections
//        return demo.demoMEDData.count
        return demo.demoCellData.count
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //#warning Incomplete method implementation -- Return the number of items in the section
//        println(section)
//        return demo.demoMEDData[section].count
        return demo.demoCellData[section].count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as UICollectionViewCell
        
        // add xib for alarm
//        let xib = UINib(nibName: "AlarmView", bundle: nil)
//        let objects = xib.instantiateWithOwner(self, options: nil)
//        let alarmContent = objects.first as UIView
//        alarmContent.layer.frame = CGRect(x: CGFloat(alarmContent.layer.frame.origin.x), y: CGFloat(alarmContent.layer.frame.origin.y), width: 150.0, height: 150.0)
//        
//        alarmContent.layer.cornerRadius = 20
//        alarmContent.layer.borderColor = UIColor.lightGrayColor().CGColor
//        alarmContent.layer.borderWidth = 2
//        cell.contentView.addSubview(alarmContent)
        
        
        // add xib for monitor employee
        
//        if indexPath.section == 1 && indexPath.row == 2 {
//            employeeCell = MonitoredEmployeeCell01(nibName: "MonitoredEmployeeCell2")
////            employeeCell = MonitoredEmployeeCell(nibName: "MonitoredEmployeeCell03")
//        }
//        else if indexPath.section == 0 && indexPath.row == 0 {
////            employeeCell = MonitoredEmployeeCell(nibName: "MonitoredEmployeeCell2")
//            employeeCell = MonitoredEmployeeCell01()
//        }
//        else {
            employeeCell = MonitoredEmployeeCell01()
//        }
            
//        employeeCell!.updateData(demo.demoMEDData[indexPath.section][indexPath.row])
        employeeCell!.updateData(demo.demoCellData[indexPath.section][indexPath.row])
        
        cell.contentView.addSubview(employeeCell!)
        
        // Configure the cell
        let themeColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0)
        cell.backgroundColor = themeColor
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(collectionView: UICollectionView, shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, canPerformAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, performAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
    
    }
    */

}
