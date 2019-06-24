//
//  BlockingProgressController.swift
//  BlockingModal
//
//  Created by Tim Fuqua on 4/7/16.
//  Copyright © 2016 Tim Fuqua. All rights reserved.
//

import UIKit

// MARK: - BlockingProgressController: UIViewController
/**

*/
class BlockingProgressController: UIViewController {
	
	// MARK: static vars
	
	// MARK: private lets
	
	private let maxProgressCounters: Float = 100.0
	
	// MARK: private vars (computed)
	
	private var completionRatio: Int {
		return Int((progressCounters/maxProgressCounters)*100.0)
	}
	
	// MARK: private vars
	
	// MARK: private(set) vars
	
	private(set) var progressCounters: Float = 0.0 {
		didSet {
			progressLabel.text = "\(completionRatio)% Done"
			progressView.setProgress(progressCounters/maxProgressCounters, animated: true)
			
			if progressCounters == maxProgressCounters {
				dismissBlockingProgressController()
			}
		}
	}
	
	// MARK: lets
	// MARK: vars (computed)
	// MARK: vars
	
	// MARK: @IBOutlets
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var progressLabel: UILabel!
	@IBOutlet weak var progressView: UIProgressView!
	
	// MARK: init
	
	// MARK: vc lifecycle
	
	override func viewDidLoad() {
		super.viewDidLoad()
		print("BlockingProgressController::viewDidLoad")
		
		delay(0.02, closure: incrementProgress)
	}
	
	// MARK: @IBActions
	
	// MARK: public funcs
	
	// MARK: private funcs
	
	private func dismissBlockingProgressController() {
		print("BlockingProgressController: dismissing self")
		dismissViewControllerAnimated(true, completion: nil)
	}
	
	private func incrementProgress() {
		progressCounters += 1.0

		if progressCounters < maxProgressCounters {
			delay(0.02, closure: incrementProgress)
		}
	}
	
	// MARK: static funcs
	
}
