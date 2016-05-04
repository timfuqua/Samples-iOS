//
//  ViewController.swift
//  BlockingModal
//
//  Created by Tim Fuqua on 4/7/16.
//  Copyright © 2016 Tim Fuqua. All rights reserved.
//

import UIKit

func delay(delay: Double, closure: ()->()) {
	dispatch_after(
		dispatch_time(
			DISPATCH_TIME_NOW,
			Int64(delay * Double(NSEC_PER_SEC))
		),
		dispatch_get_main_queue(), closure)
}

class ViewController: UIViewController {
	
	@IBOutlet weak var blockButton: UIBarButtonItem!
	
	override func viewDidLoad() {
		super.viewDidLoad()
	}
	
	@IBAction func blockButtonPressed(sender: UIBarButtonItem) {
		print("ViewController::blockButtonPressed")
		
		delay(2.0, closure: {
			let storyboardName = "BlockingProgress"
			let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
			let storyboardId = "BlockingProgressController"
			guard let blockingProgressVC = storyboard.instantiateViewControllerWithIdentifier(storyboardId) as? BlockingProgressController else {
				print("Error loading the BlockingProgressController")
				return
			}
			
			if let window = UIApplication.sharedApplication().delegate?.window {
				window?.rootViewController?.presentViewController(blockingProgressVC, animated: true, completion: nil)
			}
		})
		
//		delay(4.0, closure: {
//			
//		})
	}

}

