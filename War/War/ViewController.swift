//
//  ViewController.swift
//  War
//
//  Created by Build Account01 on 10/23/14.
//  Copyright (c) 2014 FallGuy. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var firstDeckImageView: UIImageView!
    @IBOutlet weak var secondDeckImageView: UIImageView!
    @IBOutlet weak var playRoundButton: UIButton!
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    @IBOutlet weak var player1Score: UILabel!
    @IBOutlet weak var player2Score: UILabel!
    
    var cardImages:[String] = ["ace", "card2", "card3", "card4", "card5", "card6", "card7", "card8", "card9", "card10", "jack", "queen", "king"]
    
    var player1ScoreTotal = 0
    var player2ScoreTotal = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func playRoundTapped(sender: UIButton) {

        var firstRandomNumber:Int = Int(arc4random_uniform(13))
        self.firstDeckImageView.image = UIImage(named: cardImages[firstRandomNumber])
        
        var secondRandomNumber:Int = Int(arc4random_uniform(13))
        self.secondDeckImageView.image = UIImage(named: cardImages[secondRandomNumber])
        
        if firstRandomNumber > secondRandomNumber {
            
            player1ScoreTotal++
            self.player1Score.text = String(player1ScoreTotal)
        }
        else if firstRandomNumber < secondRandomNumber {
        
            player2ScoreTotal++
            self.player2Score.text = String(player2ScoreTotal)
        }
        else {
            // TODO
        }
    }

}

