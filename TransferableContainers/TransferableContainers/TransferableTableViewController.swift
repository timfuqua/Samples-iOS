//
//  TransferableTableViewController.swift
//  TransferableContainers
//
//  Created by Tim Fuqua on 11/2/15.
//  Copyright © 2015 FuquaProductions. All rights reserved.
//

import UIKit

// MARK: TransferableTableViewController: UIViewController
/**

*/
class TransferableTableViewController: UIViewController {
  
  // MARK: class vars
  // MARK: private lets
  // MARK: private vars (computed)
  // MARK: private vars
  // MARK: private(set) vars
  // MARK: lets
  // MARK: vars (computed)
  // MARK: vars
  
  /// The data source of the table view
  var tableViewDataSource: [Car]? = nil
  
  var longPressGestureRecognizer: UILongPressGestureRecognizer!
  var transferableController: TransferableController!
  
  // MARK: @IBOutlets
  @IBOutlet weak var tableView: UITableView!
  
  // MARK: init
  
  // MARK: vc lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    longPressGestureRecognizer = UILongPressGestureRecognizer(target: self, action: Selector(stringLiteral: "longPressGestureRecognized"))
    tableView.addGestureRecognizer(longPressGestureRecognizer)
  }

  // MARK: @IBActions
  
  // MARK: public funcs

  // MARK: private funcs
  
}

extension TransferableTableViewController: UITableViewDataSource {
  
//  @available(iOS 2.0, *)
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return tableViewDataSource?.count ?? 0
  }

//  // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
//  // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
//  
//  @available(iOS 2.0, *)
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    if tableViewDataSource != nil {
      let cell: TransferableCarTableViewCell = tableView.dequeueReusableCellWithIdentifier("carTableCell", forIndexPath: indexPath) as! TransferableCarTableViewCell
      
      func configureCell(cell: TransferableCarTableViewCell) {
        cell.yearAndMakeLabel.text = tableViewDataSource![indexPath.row].year + " " + tableViewDataSource![indexPath.row].make
        cell.colorLabel.text = "in " + tableViewDataSource![indexPath.row].color
        cell.modelLabel.text = tableViewDataSource![indexPath.row].model
        cell.carImageView.image = UIImage(named: tableViewDataSource![indexPath.row].image)
      }
      
      configureCell(cell)
      
      return cell
    }
    else {
      return UITableViewCell()
    }
  }

//  @available(iOS 2.0, *)
//  optional public func numberOfSectionsInTableView(tableView: UITableView) -> Int // Default is 1 if not implemented
//  
//  @available(iOS 2.0, *)
//  optional public func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? // fixed font style. use custom view (UILabel) if you want something different
//  @available(iOS 2.0, *)
//  optional public func tableView(tableView: UITableView, titleForFooterInSection section: Int) -> String?
//  
//  // Editing
//  
//  // Individual rows can opt out of having the -editing property set for them. If not implemented, all rows are assumed to be editable.
//  @available(iOS 2.0, *)
  func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    return true
  }

//  // Moving/reordering
//  
//  // Allows the reorder accessory view to optionally be shown for a particular row. By default, the reorder control will be shown only if the datasource implements -tableView:moveRowAtIndexPath:toIndexPath:
//  @available(iOS 2.0, *)
//  optional public func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool
//  
//  // Index
//  
//  @available(iOS 2.0, *)
//  optional public func sectionIndexTitlesForTableView(tableView: UITableView) -> [String]? // return list of section titles to display in section index view (e.g. "ABCD...Z#")
//  @available(iOS 2.0, *)
//  optional public func tableView(tableView: UITableView, sectionForSectionIndexTitle title: String, atIndex index: Int) -> Int // tell table which section corresponds to section title/index (e.g. "B",1))
//  
//  // Data manipulation - insert and delete support
//  
//  // After a row has the minus or plus button invoked (based on the UITableViewCellEditingStyle for the cell), the dataSource must commit the change
//  // Not called for edit actions using UITableViewRowAction - the action's handler will be invoked instead
//  @available(iOS 2.0, *)
//  optional public func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath)
//
//  // Data manipulation - reorder / moving support
//  
//  @available(iOS 2.0, *)
  func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
    precondition(tableViewDataSource != nil)
    
    if let movingItem = tableViewDataSource?.removeAtIndex(sourceIndexPath.row) {
      tableViewDataSource?.insert(movingItem, atIndex: destinationIndexPath.row)
      tableView.reloadData()
    }
  }
  
}

extension TransferableTableViewController: UITableViewDelegate {
  
//  // Display customization
//  
//  @available(iOS 2.0, *)
//  optional public func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath)
//  @available(iOS 6.0, *)
//  optional public func tableView(tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int)
//  @available(iOS 6.0, *)
//  optional public func tableView(tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int)
//  @available(iOS 6.0, *)
//  optional public func tableView(tableView: UITableView, didEndDisplayingCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath)
//  @available(iOS 6.0, *)
//  optional public func tableView(tableView: UITableView, didEndDisplayingHeaderView view: UIView, forSection section: Int)
//  @available(iOS 6.0, *)
//  optional public func tableView(tableView: UITableView, didEndDisplayingFooterView view: UIView, forSection section: Int)
//  
//  // Variable height support
//  
//  @available(iOS 2.0, *)
//  optional public func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
//  @available(iOS 2.0, *)
//  optional public func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat
//  @available(iOS 2.0, *)
//  optional public func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat
//  
//  // Use the estimatedHeight methods to quickly calcuate guessed values which will allow for fast load times of the table.
//  // If these methods are implemented, the above -tableView:heightForXXX calls will be deferred until views are ready to be displayed, so more expensive logic can be placed there.
//  @available(iOS 7.0, *)
//  optional public func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
//  @available(iOS 7.0, *)
//  optional public func tableView(tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat
//  @available(iOS 7.0, *)
//  optional public func tableView(tableView: UITableView, estimatedHeightForFooterInSection section: Int) -> CGFloat
//  
//  // Section header & footer information. Views are preferred over title should you decide to provide both
//  
//  @available(iOS 2.0, *)
//  optional public func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? // custom view for header. will be adjusted to default or specified header height
//  @available(iOS 2.0, *)
//  optional public func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? // custom view for footer. will be adjusted to default or specified footer height
//  
//  // Accessories (disclosures).
//  
//  @available(iOS 2.0, *)
//  optional public func tableView(tableView: UITableView, accessoryButtonTappedForRowWithIndexPath indexPath: NSIndexPath)
//  
//  // Selection
//  
//  // -tableView:shouldHighlightRowAtIndexPath: is called when a touch comes down on a row.
//  // Returning NO to that message halts the selection process and does not cause the currently selected row to lose its selected look while the touch is down.
//  @available(iOS 6.0, *)
//  optional public func tableView(tableView: UITableView, shouldHighlightRowAtIndexPath indexPath: NSIndexPath) -> Bool
//  @available(iOS 6.0, *)
//  optional public func tableView(tableView: UITableView, didHighlightRowAtIndexPath indexPath: NSIndexPath)
//  @available(iOS 6.0, *)
//  optional public func tableView(tableView: UITableView, didUnhighlightRowAtIndexPath indexPath: NSIndexPath)
//  
//  // Called before the user changes the selection. Return a new indexPath, or nil, to change the proposed selection.
//  @available(iOS 2.0, *)
//  optional public func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath?
//  @available(iOS 3.0, *)
//  optional public func tableView(tableView: UITableView, willDeselectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath?
//  // Called after the user changes the selection.
//  @available(iOS 2.0, *)
//  optional public func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
//  @available(iOS 3.0, *)
//  optional public func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath)
//  
//  // Editing
//  
//  // Allows customization of the editingStyle for a particular cell located at 'indexPath'. If not implemented, all editable cells will have UITableViewCellEditingStyleDelete set for them when the table has editing property set to YES.
//  @available(iOS 2.0, *)
//  optional public func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle
//  @available(iOS 3.0, *)
//  optional public func tableView(tableView: UITableView, titleForDeleteConfirmationButtonForRowAtIndexPath indexPath: NSIndexPath) -> String?
//  @available(iOS 8.0, *)
//  optional public func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? // supercedes -tableView:titleForDeleteConfirmationButtonForRowAtIndexPath: if return value is non-nil
//  
//  // Controls whether the background is indented while editing.  If not implemented, the default is YES.  This is unrelated to the indentation level below.  This method only applies to grouped style table views.
//  @available(iOS 2.0, *)
//  optional public func tableView(tableView: UITableView, shouldIndentWhileEditingRowAtIndexPath indexPath: NSIndexPath) -> Bool
//  
//  // The willBegin/didEnd methods are called whenever the 'editing' property is automatically changed by the table (allowing insert/delete/move). This is done by a swipe activating a single row
//  @available(iOS 2.0, *)
//  optional public func tableView(tableView: UITableView, willBeginEditingRowAtIndexPath indexPath: NSIndexPath)
//  @available(iOS 2.0, *)
//  optional public func tableView(tableView: UITableView, didEndEditingRowAtIndexPath indexPath: NSIndexPath)
//  
//  // Moving/reordering
//  
//  // Allows customization of the target row for a particular row as it is being moved/reordered
//  @available(iOS 2.0, *)
//  optional public func tableView(tableView: UITableView, targetIndexPathForMoveFromRowAtIndexPath sourceIndexPath: NSIndexPath, toProposedIndexPath proposedDestinationIndexPath: NSIndexPath) -> NSIndexPath
//  
//  // Indentation
//  
//  @available(iOS 2.0, *)
//  optional public func tableView(tableView: UITableView, indentationLevelForRowAtIndexPath indexPath: NSIndexPath) -> Int // return 'depth' of row for hierarchies
//  
//  // Copy/Paste.  All three methods must be implemented by the delegate.
//  
//  @available(iOS 5.0, *)
//  optional public func tableView(tableView: UITableView, shouldShowMenuForRowAtIndexPath indexPath: NSIndexPath) -> Bool
//  @available(iOS 5.0, *)
//  optional public func tableView(tableView: UITableView, canPerformAction action: Selector, forRowAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool
//  @available(iOS 5.0, *)
//  optional public func tableView(tableView: UITableView, performAction action: Selector, forRowAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?)
//  
//  // Focus
//  
//  @available(iOS 9.0, *)
//  optional public func tableView(tableView: UITableView, canFocusRowAtIndexPath indexPath: NSIndexPath) -> Bool
//  @available(iOS 9.0, *)
//  optional public func tableView(tableView: UITableView, shouldUpdateFocusInContext context: UITableViewFocusUpdateContext) -> Bool
//  @available(iOS 9.0, *)
//  optional public func tableView(tableView: UITableView, didUpdateFocusInContext context: UITableViewFocusUpdateContext, withAnimationCoordinator coordinator: UIFocusAnimationCoordinator)
//  @available(iOS 9.0, *)
//  optional public func indexPathForPreferredFocusedViewInTableView(tableView: UITableView) -> NSIndexPath?
  
}

extension TransferableTableViewController: TransferableContents {
  
  func longPressGestureRecognized() {
//    print("")
//    print("TransferableTableViewController::longPressGestureRecognized:")
    
    let state: UIGestureRecognizerState = longPressGestureRecognizer.state
    
    switch state {
    case .Began:
      transferableController.contentDidStartMoving(longPressGestureRecognizer)
    case .Changed:
      transferableController.contentMoving(longPressGestureRecognizer)
    case .Ended:
      transferableController.contentDidEndMoving(longPressGestureRecognizer)
    default:
      break
    }
  }
  
}
