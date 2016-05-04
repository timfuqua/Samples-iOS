//
//  CollectionViewThings.swift
//  SplitViewTest
//
//  Created by Tim Fuqua on 4/18/16.
//  Copyright © 2016 Tim Fuqua. All rights reserved.
//

import UIKit

// MARK: - CollectionViewThings: UIViewController
/**

*/
class CollectionViewThings: UIViewController {
	
	// MARK: static vars
	// MARK: private lets
	// MARK: private vars (computed)
	// MARK: private vars
	// MARK: private(set) vars
	// MARK: lets
	// MARK: vars (computed)
	// MARK: vars
	
	/// The data source of the collection view
	var collectionViewDataSource: [String]? = nil
	
	// MARK: @IBOutlets
	@IBOutlet weak var thingsCollectionView: UICollectionView!
	
	// MARK: init
	
	// MARK: vc lifecycle
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		collectionViewDataSource = ["One", "Two", "Three"]
	}
	
	override func viewDidAppear(animated: Bool) {
		thingsCollectionView.reloadData()
	}
	
	// MARK: @IBActions
	
	// MARK: public funcs
	
	// MARK: private funcs
	
	// MARK: static funcs
	
}

// MARK: - CollectionViewThings: UICollectionViewDataSource
/**

*/
extension CollectionViewThings: UICollectionViewDataSource {
	
	//  @available(iOS 6.0, *)
	func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return collectionViewDataSource?.count ?? 0
	}
	
	//  // The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
	//  @available(iOS 6.0, *)
	func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
		if let dataSource = collectionViewDataSource {
			let cell: CollectionViewThingOneCell = collectionView.dequeueReusableCellWithReuseIdentifier("CVThingOneCell", forIndexPath: indexPath) as! CollectionViewThingOneCell
			
			func configureCell(cell: CollectionViewThingOneCell) -> CollectionViewThingOneCell {
				cell.contentLabel.text = dataSource[indexPath.row]
				
				return cell
			}
			
			return configureCell(cell)
		} else {
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

// MARK: - CollectionViewThings: UICollectionViewDelegate
/**

*/
extension CollectionViewThings: UICollectionViewDelegate {
	
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

// MARK: - CollectionViewThings: UICollectionViewDelegateFlowLayout
/**

*/
extension CollectionViewThings: UICollectionViewDelegateFlowLayout {
	
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
