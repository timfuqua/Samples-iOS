//
//  MainController.swift
//  FormerSampleApp
//
//  Created by Tim Fuqua on 5/3/16.
//  Copyright © 2016 Tim Fuqua. All rights reserved.
//

import UIKit
import Former

// MARK: - MainController: UIViewController
/**

*/
class MainController: UIViewController {
	
	// MARK: static vars
	// MARK: private lets
	// MARK: private vars (computed)
	// MARK: private vars
	
	private lazy var former: Former = Former(tableView: self.formSelectionTableView)
	
	// MARK: private(set) vars
	// MARK: lets
	// MARK: vars (computed)
	// MARK: vars
	
	// MARK: @IBOutlets
	@IBOutlet weak var formSelectionTableView: UITableView!
	
	// MARK: init
	
	// MARK: vc lifecycle
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		title = "Custom Forms"
		configure()
	}
	
	// MARK: @IBActions
	
	// MARK: public funcs
	
	// MARK: private funcs
	
	private func configure() {
		let createRequiredFieldRow: String -> CustomRowFormer<LabelAndTextFieldWithErrorCell> = { text in
			return CustomRowFormer<LabelAndTextFieldWithErrorCell>(instantiateType: .Nib(nibName: "LabelAndTextFieldWithErrorCell")) {
				$0.prompt = "\(text)*"
				$0.valuePlaceholder = "\(text)"
				$0.errorText = "This field is required"
				$0.errorColor = UIColor(red: 0.8, green: 0.3, blue: 0.3, alpha: 1.0)
				}.configure {
					$0.rowHeight = UITableViewAutomaticDimension
			}
		}
		
		let createNonRequiredFieldRow: String -> CustomRowFormer<LabelAndTextFieldWithErrorCell> = { text in
			return CustomRowFormer<LabelAndTextFieldWithErrorCell>(instantiateType: .Nib(nibName: "LabelAndTextFieldWithErrorCell")) {
				$0.prompt = "\(text)"
				$0.valuePlaceholder = "\(text)"
				$0.errorText = ""
				$0.errorColor = UIColor(red: 0.8, green: 0.3, blue: 0.3, alpha: 1.0)
				}.configure {
					$0.rowHeight = UITableViewAutomaticDimension
			}
		}
		
		let firstNameRow = createRequiredFieldRow("First Name")
		let lastNameRow = createRequiredFieldRow("Last Name")
		let emailRow = createRequiredFieldRow("Email")
		let favoriteColor = createNonRequiredFieldRow("Favorite Color")
		
		// Create Headers
		
		let createHeader: (String -> ViewFormer) = { text in
			return LabelViewFormer<FormLabelHeaderView>()
				.configure {
					$0.text = text
					$0.viewHeight = 44
			}
		}
		
		// Create Section
		
		let requiredInfoSection = SectionFormer(rowFormer: firstNameRow, lastNameRow, emailRow, favoriteColor)
			.set(headerViewFormer: createHeader("New Contact Info"))
		
		former.append(sectionFormer: requiredInfoSection)
	}
	
	// MARK: static funcs
	
}




