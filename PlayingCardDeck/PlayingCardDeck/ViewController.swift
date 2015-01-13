//
//  ViewController.swift
//  PlayingCardDeck
//
//  Created by Tim Fuqua on 1/1/15.
//  Copyright (c) 2015 FuquaProductions. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{

    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var aDeck: [PlayingCard] = createDeck()
        printDeck(aDeck)
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

