//
//  TransferableCollectionViewController.swift
//  TransferableContainers
//
//  Created by Tim Fuqua on 11/2/15.
//  Copyright © 2015 FuquaProductions. All rights reserved.
//

import UIKit

// MARK: TransferableCollectionViewController: UIViewController
/**

*/
class TransferableCollectionViewController: UIViewController {
  
  // MARK: class vars
  // MARK: private lets
  // MARK: private vars (computed)
  // MARK: private vars
  // MARK: private(set) vars
  // MARK: lets
  // MARK: vars (computed)
  // MARK: vars
  
  /// The data source of the collection view
  var collectionViewDataSource: [Car]? = nil
  
  // MARK: @IBOutlets
  
  // MARK: init
  
  // MARK: vc lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  // MARK: @IBActions
  
  // MARK: public funcs
  
  // MARK: private funcs
  
}

// MARK: TransferableCollectionViewController: UICollectionViewDataSource
/**

*/
extension TransferableCollectionViewController: UICollectionViewDataSource {
  
//  @available(iOS 6.0, *)
  func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return collectionViewDataSource?.count ?? 0
  }
  
//  // The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
//  @available(iOS 6.0, *)
  func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
    if collectionViewDataSource != nil {
      let cell: TransferableCarCollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier("carCollectionCell", forIndexPath: indexPath) as! TransferableCarCollectionViewCell
      
      func configureCell(cell: TransferableCarCollectionViewCell) {
        cell.yearLabel.text = collectionViewDataSource![indexPath.row].year
        cell.colorLabel.text = collectionViewDataSource![indexPath.row].color
        cell.makeLabel.text = collectionViewDataSource![indexPath.row].make
        cell.modelLabel.text = collectionViewDataSource![indexPath.row].model
        cell.imageView.image = UIImage(named: collectionViewDataSource![indexPath.row].image)
      }
      
      configureCell(cell)
      
      return cell
    }
    else {
      return UICollectionViewCell()
    }
  }

//  @available(iOS 6.0, *)
//  optional public func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int
//  
//  // The view that is returned must be retrieved from a call to -dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:
//  @available(iOS 6.0, *)
//  optional public func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView
//  
//  @available(iOS 9.0, *)
//  optional public func collectionView(collectionView: UICollectionView, canMoveItemAtIndexPath indexPath: NSIndexPath) -> Bool
//  @available(iOS 9.0, *)
//  optional public func collectionView(collectionView: UICollectionView, moveItemAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath)
  
}

// MARK: TransferableCollectionViewController: UICollectionViewDelegate
/**

*/
extension TransferableCollectionViewController: UICollectionViewDelegate {
  
  // Methods for notification of selection/deselection and highlight/unhighlight events.
  // The sequence of calls leading to selection from a user touch is:
  //
  // (when the touch begins)
  // 1. -collectionView:shouldHighlightItemAtIndexPath:
  // 2. -collectionView:didHighlightItemAtIndexPath:
  //
  // (when the touch lifts)
  // 3. -collectionView:shouldSelectItemAtIndexPath: or -collectionView:shouldDeselectItemAtIndexPath:
  // 4. -collectionView:didSelectItemAtIndexPath: or -collectionView:didDeselectItemAtIndexPath:
  // 5. -collectionView:didUnhighlightItemAtIndexPath:
//  @available(iOS 6.0, *)
//  optional public func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool
//  @available(iOS 6.0, *)
//  optional public func collectionView(collectionView: UICollectionView, didHighlightItemAtIndexPath indexPath: NSIndexPath)
//  @available(iOS 6.0, *)
//  optional public func collectionView(collectionView: UICollectionView, didUnhighlightItemAtIndexPath indexPath: NSIndexPath)
//  @available(iOS 6.0, *)
//  optional public func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool
//  @available(iOS 6.0, *)
//  optional public func collectionView(collectionView: UICollectionView, shouldDeselectItemAtIndexPath indexPath: NSIndexPath) -> Bool // called when the user taps on an already-selected item in multi-select mode
//  @available(iOS 6.0, *)
//  optional public func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath)
//  @available(iOS 6.0, *)
//  optional public func collectionView(collectionView: UICollectionView, didDeselectItemAtIndexPath indexPath: NSIndexPath)
//  
//  @available(iOS 8.0, *)
//  optional public func collectionView(collectionView: UICollectionView, willDisplayCell cell: UICollectionViewCell, forItemAtIndexPath indexPath: NSIndexPath)
//  @available(iOS 8.0, *)
//  optional public func collectionView(collectionView: UICollectionView, willDisplaySupplementaryView view: UICollectionReusableView, forElementKind elementKind: String, atIndexPath indexPath: NSIndexPath)
//  @available(iOS 6.0, *)
//  optional public func collectionView(collectionView: UICollectionView, didEndDisplayingCell cell: UICollectionViewCell, forItemAtIndexPath indexPath: NSIndexPath)
//  @available(iOS 6.0, *)
//  optional public func collectionView(collectionView: UICollectionView, didEndDisplayingSupplementaryView view: UICollectionReusableView, forElementOfKind elementKind: String, atIndexPath indexPath: NSIndexPath)
//  
//  // These methods provide support for copy/paste actions on cells.
//  // All three should be implemented if any are.
//  @available(iOS 6.0, *)
//  optional public func collectionView(collectionView: UICollectionView, shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath) -> Bool
//  @available(iOS 6.0, *)
//  optional public func collectionView(collectionView: UICollectionView, canPerformAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool
//  @available(iOS 6.0, *)
//  optional public func collectionView(collectionView: UICollectionView, performAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?)
//  
//  // support for custom transition layout
//  @available(iOS 7.0, *)
//  optional public func collectionView(collectionView: UICollectionView, transitionLayoutForOldLayout fromLayout: UICollectionViewLayout, newLayout toLayout: UICollectionViewLayout) -> UICollectionViewTransitionLayout
//  
//  // Focus
//  @available(iOS 9.0, *)
//  optional public func collectionView(collectionView: UICollectionView, canFocusItemAtIndexPath indexPath: NSIndexPath) -> Bool
//  @available(iOS 9.0, *)
//  optional public func collectionView(collectionView: UICollectionView, shouldUpdateFocusInContext context: UICollectionViewFocusUpdateContext) -> Bool
//  @available(iOS 9.0, *)
//  optional public func collectionView(collectionView: UICollectionView, didUpdateFocusInContext context: UICollectionViewFocusUpdateContext, withAnimationCoordinator coordinator: UIFocusAnimationCoordinator)
//  @available(iOS 9.0, *)
//  optional public func indexPathForPreferredFocusedViewInCollectionView(collectionView: UICollectionView) -> NSIndexPath?
//  
//  @available(iOS 9.0, *)
//  optional public func collectionView(collectionView: UICollectionView, targetIndexPathForMoveFromItemAtIndexPath originalIndexPath: NSIndexPath, toProposedIndexPath proposedIndexPath: NSIndexPath) -> NSIndexPath
//  
//  @available(iOS 9.0, *)
//  optional public func collectionView(collectionView: UICollectionView, targetContentOffsetForProposedContentOffset proposedContentOffset: CGPoint) -> CGPoint // customize the content offset to be applied during transition or update animations
  
}

// MARK: TransferableCollectionViewController: UICollectionViewDelegateFlowLayout
/**

*/
extension TransferableCollectionViewController: UICollectionViewDelegateFlowLayout {
  
//  @available(iOS 6.0, *)
//  optional public func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize
//  @available(iOS 6.0, *)
//  optional public func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets
//  @available(iOS 6.0, *)
//  optional public func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat
//  @available(iOS 6.0, *)
//  optional public func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat
//  @available(iOS 6.0, *)
//  optional public func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize
//  @available(iOS 6.0, *)
//  optional public func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize
  
}
