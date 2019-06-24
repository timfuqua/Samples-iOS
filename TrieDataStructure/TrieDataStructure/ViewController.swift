//
//  ViewController.swift
//  TrieDataStructure
//
//  Created by Tim Fuqua on 6/23/19.
//  Copyright © 2019 Norswedgian Studios. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

}

// MARK:- lifecycle
extension ViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        print("initially empty")
        let dictionary = Trie()

        var containsCute = dictionary.contains(word: "cute")
        print("contains 'cute': \(containsCute)")
        
        print("add 'cute'")
        dictionary.insert(word: "cute")
        
        containsCute = dictionary.contains(word: "cute")
        print("contains 'cute': \(containsCute)")
        
        var containsCut = dictionary.contains(word: "cut")
        print("contains 'cut': \(containsCut)")
        
        print("add 'cut'")
        dictionary.insert(word: "cut")
        
        containsCut = dictionary.contains(word: "cut")
        print("contains 'cut': \(containsCut)")
    }
}
