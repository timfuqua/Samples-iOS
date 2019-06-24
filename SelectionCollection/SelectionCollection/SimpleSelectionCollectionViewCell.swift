//
//  SimpleSelectionCollectionViewCell.swift
//  SelectionCollection
//
//  Created by Tim Fuqua on 3/10/19.
//  Copyright © 2019 Norswedgian Studios. All rights reserved.
//

import UIKit

class SimpleSelectionCollectionViewCell: UICollectionViewCell {
    
    private var viewModel: SimpleSelectionViewModel
    
    var titleLabel: UILabel
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(withViewModel viewModel: SimpleSelectionViewModel) {
        
    }
    
}
