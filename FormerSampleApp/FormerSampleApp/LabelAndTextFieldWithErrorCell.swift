//
//  LabelAndTextFieldWithErrorCell.swift
//  FormerSampleApp
//
//  Created by Tim Fuqua on 5/3/16.
//  Copyright © 2016 Tim Fuqua. All rights reserved.
//

import UIKit
import Former

// MARK: - LabelAndTextFieldWithErrorCell: UITableViewCell
/**

*/
class LabelAndTextFieldWithErrorCell: UITableViewCell {
	
	// MARK: static vars
	// MARK: private lets
	// MARK: private vars (computed)
	// MARK: private vars
	// MARK: private(set) vars
	// MARK: lets
	// MARK: vars (computed)
	// MARK: vars
	
	var prompt: String? {
		get { return promptLabel.text }
		set { promptLabel.text = newValue }
	}
	
	var valueText: String? {
		get { return valueTextField.text }
		set { valueTextField.text = newValue }
	}
	var valuePlaceholder: String? {
		get { return valueTextField.placeholder }
		set { valueTextField.placeholder = newValue }
	}
	var textFieldColor: UIColor? {
		get { return valueTextField.textColor }
		set { valueTextField.textColor = newValue }
	}
	
	var errorText: String? {
		get { return errorLabel.text }
		set {
			errorLabel.text = newValue
			errorLabel.hidden = valueText?.isEmpty == false
		}
	}
	var errorColor: UIColor? {
		get { return errorLabel.textColor }
		set { errorLabel.textColor = newValue }
	}
	
	// MARK: @IBOutlets
	@IBOutlet private weak var labelAndTextFieldView: UIView!
	@IBOutlet private weak var promptLabel: UILabel!
	@IBOutlet private weak var valueTextField: UITextField!
	
	@IBOutlet private weak var errorView: UIView!
	@IBOutlet private weak var errorLabel: UILabel!
	
	// MARK: init
	
	override func awakeFromNib() {
		super.awakeFromNib()
	}
	
	// MARK: public funcs
	
	// MARK: private funcs
	
	// MARK: static funcs
	
}

