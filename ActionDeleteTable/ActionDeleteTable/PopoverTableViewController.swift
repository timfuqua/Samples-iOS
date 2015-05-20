//
//  PopoverTableViewController.swift
//  ActionDeleteTable
//
//  Created by Tim Fuqua on 5/11/15.
//  Copyright (c) 2015 FuquaProductions. All rights reserved.
//

import UIKit

protocol PopoverTableViewControllerDelegate {
  func popoverSelectionMade(index: Int)
  func popoverDeletionMade(index: Int)
  func popoverClosedWithoutSelection()
  func popoverClosed()
}

class PopoverTableViewController: UIViewController {
  
  var dataSource: [String] = []
  var delegate: PopoverTableViewControllerDelegate? = nil
  
  @IBOutlet weak var popoverTableView: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    popoverTableView.rowHeight = 44.0
    let newHeight: CGFloat = fmin(fmax(CGFloat(popoverTableView.numberOfRowsInSection(0))*popoverTableView.rowHeight - 2, popoverTableView.rowHeight - 2), 600)
    self.preferredContentSize = CGSizeMake(popoverTableView.frame.width, newHeight)
  }
  
  override func viewWillDisappear(animated: Bool) {
    super.viewWillDisappear(animated)
    
    delegate?.popoverClosed()
  }
  
  private func closePopover() {
    self.dismissViewControllerAnimated(true, completion: nil)
  }
  
}

extension PopoverTableViewController: UITableViewDataSource {
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    println("dataSource.count: \(dataSource.count)")
    return dataSource.count
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    var cell = tableView.dequeueReusableCellWithIdentifier("popoverCell") as UITableViewCell
    cell.textLabel!.text = dataSource[indexPath.row]
    
    return cell
  }
  
  func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    if editingStyle == UITableViewCellEditingStyle.Delete {
      dataSource.removeAtIndex(indexPath.row)
      delegate?.popoverDeletionMade(indexPath.row)
      tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
    }
  }
  
}

extension PopoverTableViewController: UITableViewDelegate {
  
//  func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
//    let cell: UITableViewCell = tableView.cellForRowAtIndexPath(indexPath)!
//    if cell.selectionStyle == .None {
//      return nil
//    }
//    else {
//      return indexPath
//    }
//  }
  
  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    tableView.deselectRowAtIndexPath(indexPath, animated: false)
    
    delegate?.popoverSelectionMade(indexPath.row)
    closePopover()
  }
  
}

