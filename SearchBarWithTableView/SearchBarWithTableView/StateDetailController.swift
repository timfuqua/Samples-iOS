//
//  StateDetailController.swift
//  SearchBarWithTableView
//
//  Created by Tim Fuqua on 5/2/16.
//  Copyright © 2016 Tim Fuqua. All rights reserved.
//

import UIKit

// MARK: - StateDetailController: UIViewController
/**

*/
class StateDetailController: UIViewController {
	
	// MARK: static vars
	// MARK: private lets
	
	///
	private var introMessage: (StateInfo) -> String = { state in
		return "Hi, I'm \(state.name).\nMy capital is \(state.capital)."
	}
	
	// MARK: private vars (computed)
	// MARK: private vars
	// MARK: private(set) vars
	// MARK: lets
	// MARK: vars (computed)
	// MARK: vars
	
	var stateInfo: StateInfo!
	
	// MARK: @IBOutlets
	@IBOutlet weak var introductionLabel: UILabel!
	
	// MARK: init
	
	// MARK: vc lifecycle
	
	override func viewDidLoad() {
		super.viewDidLoad()
	}
	
	override func viewWillAppear(animated: Bool) {
		super.viewWillAppear(animated)
		
		navigationController?.title = stateInfo.name
		introductionLabel.text = introMessage(stateInfo)
	}
	
	// MARK: @IBActions
	
	// MARK: public funcs
	
	// MARK: private funcs
	
	// MARK: static funcs
	
}
