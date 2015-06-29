//
//  ViewController.swift
//  MoaWithPods
//
//  Created by Tim Fuqua on 6/29/15.
//  Copyright (c) 2015 FuquaProductions. All rights reserved.
//

import UIKit
import moa

class ViewController: UIViewController {
  
  @IBOutlet weak var mainView: UIImageView!
  
  @IBOutlet weak var p1HandView: UIView!
  @IBOutlet weak var p2HandView: UIView!
  
  @IBOutlet weak var boardView: UIView!
  @IBOutlet weak var gridView: UIView!
  @IBOutlet weak var gridUL: UIImageView!
  @IBOutlet weak var gridUM: UIImageView!
  @IBOutlet weak var gridUR: UIImageView!
  @IBOutlet weak var gridML: UIImageView!
  @IBOutlet weak var gridMM: UIImageView!
  @IBOutlet weak var gridMR: UIImageView!
  @IBOutlet weak var gridLL: UIImageView!
  @IBOutlet weak var gridLM: UIImageView!
  @IBOutlet weak var gridLR: UIImageView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    initializeMainViewImageURL()
  }
  
  private func initializeMainViewImageURL() {
    mainView.moa.url = "http://img1.wikia.nocookie.net/__cb20120424201227/finalfantasy/images/3/38/Triple_Triad_Board.png"
  }

  private func initializeGridImageURLs() {
  }

}

