//
//  StateInfo.swift
//  SearchBarWithTableView
//
//  Created by Tim Fuqua on 5/2/16.
//  Copyright © 2016 Tim Fuqua. All rights reserved.
//

import Foundation

// MARK: - StateInfo
/**
State info: name, capital
*/
struct StateInfo {
	
	// MARK: static vars
	// MARK: private lets
	// MARK: private vars (computed)
	// MARK: private vars
	// MARK: private(set) vars
	// MARK: lets
	// MARK: vars (computed)
	
	var indexTitle: String? {
		guard let firstChar = name.characters.first else {
			return nil
		}
		
		return "\(firstChar)"
	}
	
	// MARK: vars
	var name: String
	var capital: String
	
	// MARK: init
	init(rawStateString: String, delimitedBy delimiter: String) {
		let rawStateInfo = rawStateString.componentsSeparatedByString(delimiter)
		self.name = rawStateInfo[0]
		self.capital = rawStateInfo[1]
	}
	
	// MARK: public funcs
	
	// MARK: private funcs
	
	// MARK: static funcs
	
}

extension StateInfo: Hashable {
	
	var hashValue: Int {
		return name.hashValue ^ capital.hashValue
	}
	
}

func ==(lhs: StateInfo, rhs: StateInfo) -> Bool {
	return lhs.name == rhs.name && lhs.capital == rhs.capital
}
