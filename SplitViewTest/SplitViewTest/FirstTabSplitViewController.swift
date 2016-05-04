//
//  FirstTabSplitViewController.swift
//  SplitViewTest
//
//  Created by Tim Fuqua on 4/18/16.
//  Copyright © 2016 Tim Fuqua. All rights reserved.
//

import UIKit

class FirstTabSplitViewController: UISplitViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
	}

}

// MARK: - FirstTabSplitViewController: UISplitViewControllerDelegate
extension FirstTabSplitViewController {
	
//	func splitViewController(splitViewController: UISplitViewController, collapseSecondaryViewController secondaryViewController:UIViewController!, ontoPrimaryViewController primaryViewController:UIViewController!) -> Bool {
//		if let secondaryAsNavController = secondaryViewController as? UINavigationController {
//			if let topAsDetailController = secondaryAsNavController.topViewController as? FirstDoThingViewController where topAsDetailController.session == nil {
//				// If there's no session, then we only want to show the primary. This is the
//				// only case where we return true. Remember, returning true means we've handled
//				// the collapse -- in this case, we've handled it by doing nothing! :]
//				return true
//			}
//			
//			// Otherwise, we want the default behavior of pushing whatever's on the secondary
//			// onto the primary. In that case, we should make sure the primary's navigation
//			// bar is displayed if it's a navigation controller.
//			if let primaryAsNavController = primaryViewController as? UINavigationController {
//				primaryAsNavController.setNavigationBarHidden(false, animated: false)
//			}
//		}
//		
//		// Returning false means we want the split view controller to handle the collapse.
//		// In this app with its navigation controllers on both the primary and secondary,
//		// it will simply push everything on the secondary onto the primary.
//		return false
//	}
	
}