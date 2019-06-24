//
//  FirstDoThingViewController.swift
//  SplitViewTest
//
//  Created by Tim Fuqua on 4/18/16.
//  Copyright © 2016 Tim Fuqua. All rights reserved.
//

import UIKit

// MARK: - FirstDoThingViewController: UIViewController
/**

*/
class FirstDoThingViewController: UIViewController {
	
	// MARK: static vars
	// MARK: private lets
	// MARK: private vars (computed)
	// MARK: private vars
	// MARK: private(set) vars
	// MARK: lets
	// MARK: vars (computed)
	// MARK: vars
	
	// MARK: @IBOutlets
	@IBOutlet weak var instructionButtonPressed: UIButton!
	
	// MARK: init
	
	// MARK: vc lifecycle
	
	override func viewDidLoad() {
		super.viewDidLoad()
	}
	
	// MARK: @IBActions
	@IBAction func instructionButtonPressed(sender: UIButton) {
		print("FirstDoThingViewController::instructionButtonPressed: Doing that thing!")
	}
	
	// MARK: public funcs
	
	// MARK: private funcs
	
	// MARK: static funcs
	
}
