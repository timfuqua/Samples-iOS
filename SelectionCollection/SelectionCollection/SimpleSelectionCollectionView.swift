//
//  SelectionCollectionView.swift
//  SelectionCollection
//
//  Created by Tim Fuqua on 3/10/19.
//  Copyright © 2019 Norswedgian Studios. All rights reserved.
//

import UIKit

class SimpleSelectionCollectionView: UICollectionView, UICollectionViewDataSource {
    
    private var selections: [String]
//    private let flowLayout: UICollectionViewFlowLayout
    
    convenience init(frame: CGRect, selections: [String]) {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        self.init(frame: frame, collectionViewLayout: flowLayout, selections: selections)
    }
    
    init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout, selections: [String]) {
        self.selections = selections
        super.init(frame: frame, collectionViewLayout: layout)
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


// MARK:- UICollectionViewDataSource
extension SimpleSelectionCollectionView {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = UICollectionViewCell()
        cell.
        return cell
    }
}
