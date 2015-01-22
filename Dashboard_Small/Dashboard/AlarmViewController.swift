//
//  AlarmViewController.swift
//  Dashboard
//
//  Created by stephen zhou on 1/16/15.
//  Copyright (c) 2015 stephen zhou. All rights reserved.
//

import UIKit

private let reuseIdentifier = "AlarmCell"

class AlarmViewController: UICollectionViewController {
    var thirdEmployeeCell: MonitoredEmployeeCell03?
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
        return 1
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //#warning Incomplete method implementation -- Return the number of items in the section
        return 12
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as UICollectionViewCell
        
        // add xib for alarm
//        let xib = UINib(nibName: "AlarmView", bundle: nil)
//        let objects = xib.instantiateWithOwner(self, options: nil)
//        let alarmContent = objects.first as UIView
//        alarmContent.layer.frame = CGRect(x: CGFloat(alarmContent.layer.frame.origin.x), y: CGFloat(alarmContent.layer.frame.origin.y), width: 200.0, height: 200.0)
//        
//        alarmContent.layer.cornerRadius = 20
//        alarmContent.layer.borderColor = UIColor.lightGrayColor().CGColor
//        alarmContent.layer.borderWidth = 2
//        cell.contentView.addSubview(alarmContent)
        
        
        // add xib for monitor employee
        var thirdEmployee: MonitoredEmployeeData = MonitoredEmployeeData(name: "John Andrews", acdName: "HOLD", position: "2030475", acdState: "HOLD", timeInState: "01:46:08")
//        var thirdEmployeeCellData: CellData = CellData(name: "John Andrews", left1: "ACD Name", right1: "HOLD", left2: "Position", right2: "2030475", left3: "ACD State", right3: "HOLD", left4: "Time in State", right4: "01:46:08")
        var thirdEmployeeCellData: CellData = CellData(name: "John Andrews")
        thirdEmployeeCellData.addEntry("HOLD", right: "01:46:08")
//        thirdEmployeeCellData.addEntry("HOLD", right: nil)
//        thirdEmployeeCellData.addEntry(nil, right: "01:46:08")
//        thirdEmployeeCellData.addEntry("ACD State", right: "HOLD")
//        thirdEmployeeCellData.addEntry("Time in State", right: "01:46:08")
        thirdEmployeeCell = MonitoredEmployeeCell03()
//        thirdEmployeeCell!.updateData(thirdEmployee)
        thirdEmployeeCell!.updateData(thirdEmployeeCellData)
        cell.contentView.addSubview(thirdEmployeeCell!)
        
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
