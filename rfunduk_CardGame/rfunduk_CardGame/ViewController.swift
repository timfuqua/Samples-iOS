//
//  ViewController.swift
//  rfunduk_CardGame
//
//  Created by Tim Fuqua on 1/1/15.
//  Copyright (c) 2015 FuquaProductions. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let games = 1000
        var wins = 0
        for _ in 0...games { if Game().play() { wins++ } }
        
        let winningPercentage = Double(wins) / Double(games)
        println("Played \(games) games, \(wins) (\(winningPercentage)%) wins.")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

