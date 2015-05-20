//
//  ViewController.swift
//  ActionDeleteTable
//
//  Created by Tim Fuqua on 5/11/15.
//  Copyright (c) 2015 FuquaProductions. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  var selectionNumber: Int = 1
  var possibleSelections: [String] = []
  
  @IBOutlet weak var displayInAlertButton: UIButton!
  @IBOutlet weak var displayInLabelButton: UIButton!
  @IBOutlet weak var selectionLabel: UILabel!
  @IBOutlet weak var addButton: UIBarButtonItem!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    addSelectionOption()
  }
  
  @IBAction func displayInAlertButtonPressed(sender: UIButton) {
    invokeModalPopoverWithDataSource(&possibleSelections, sender: sender)
  }
  
  @IBAction func displayInLabelButtonPressed(sender: UIButton) {
    invokeModalPopoverWithDataSource(&possibleSelections, sender: sender)
  }
  
  @IBAction func addButtonPressed(sender: UIBarButtonItem) {
    addSelectionOption()
  }
  
  private func addSelectionOption() {
    possibleSelections.append("Selection \(selectionNumber)")
    selectionNumber++
  }
  
  private func removeSelectionOption(index: Int) {
    possibleSelections.removeAtIndex(index)
  }
  
  private func invokeModalPopoverWithDataSource(inout dataSource: [String], sender: UIButton) {
    let popoverVC: PopoverTableViewController = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle()).instantiateViewControllerWithIdentifier("Popover") as PopoverTableViewController
    
    popoverVC.dataSource = dataSource
    popoverVC.delegate = self
    
    popoverVC.modalPresentationStyle = UIModalPresentationStyle.Popover
    if let popoverController = popoverVC.popoverPresentationController {
      popoverController.sourceView = sender
      popoverController.sourceRect = sender.bounds
      popoverController.permittedArrowDirections = UIPopoverArrowDirection.Up
    }
    presentViewController(popoverVC, animated: true, completion: nil)
  }
  
  private func invokeAlertView(title: String, withMessage: String) {
    let alertController = UIAlertController(title: title, message: withMessage, preferredStyle: UIAlertControllerStyle.Alert)
    alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default, handler: nil))
    self.presentViewController(alertController, animated: true, completion: nil)
  }

}

extension ViewController: PopoverTableViewControllerDelegate {
  
  func popoverSelectionMade(index: Int) {
    
    println("Selected: \(index)")
    invokeAlertView("Selection Made", withMessage: possibleSelections[index])
  }
  
  func popoverDeletionMade(index: Int) {
    
    removeSelectionOption(index)
    println("Deleted: \(index)")
  }
  
  func popoverClosedWithoutSelection() {
    
    println("Popover closed without selection")
  }
  
  func popoverClosed() {
    
    println(possibleSelections)
  }
  
}
