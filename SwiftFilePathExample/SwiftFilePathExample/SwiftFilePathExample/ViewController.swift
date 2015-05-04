//
//  ViewController.swift
//  SwiftFilePathExample
//
//  Created by Tim Fuqua on 4/30/15.
//  Copyright (c) 2015 FuquaProductions. All rights reserved.
//

import UIKit
import SwiftFilePath

class ViewController: UIViewController {
  
  var sampleData: DataObject = DataObject()
  
  @IBOutlet weak var firstTextField: UITextField!
  @IBOutlet weak var secondTextField: UITextField!
  @IBOutlet weak var filenameTextField: UITextField!
  @IBOutlet weak var newButton: UIButton!
  @IBOutlet weak var saveButton: UIButton!
  @IBOutlet weak var loadButton: UIButton!
  
  @IBOutlet weak var fileContents: UITextView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    println(Path.homeDir.toString())
    println(Path.documentsDir.toString())
    println(Path.cacheDir.toString())
    println(Path.temporaryDir.toString())
    
    initializeTextFields()
    initializeFileContentsTextView()
  }
  
  override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
    fillOutData()
    view.endEditing(true)
    super.touchesBegan(touches, withEvent: event)
  }
  
  @IBAction func newButtonPressed(sender: UIButton) {
  }
  
  @IBAction func saveButtonPressed(sender: UIButton) {
    fillOutData()
    sampleData.save()
  }
  
  @IBAction func loadButtonPressed(sender: UIButton) {
    sampleData.load()
    updateTextView()
  }
  
  private func initializeTextFields() {
    firstTextField.delegate = self
    secondTextField.delegate = self
  }
  
  private func initializeFileContentsTextView() {
    fileContents.layer.borderWidth = 2.0
    fileContents.layer.borderColor = UIColor.darkGrayColor().CGColor
    fileContents.layer.cornerRadius = 5.0
  }
  
  private func updateTextView() {
    fileContents.text = sampleData.debugDescription
  }
  
  private func updateTextFields() {
    fileContents.text = sampleData.debugDescription
  }
  
  private func fillOutData() {
    sampleData.field1 = firstTextField.text
    sampleData.field2 = secondTextField.text
  }
  
}

extension ViewController: UITextFieldDelegate {
  
  func textFieldShouldReturn(textField: UITextField) -> Bool {
    fillOutData()
    dissmissKeyboard()
    
    return true
  }
  
  private func dissmissKeyboard() {
    if firstTextField.isFirstResponder() {
      firstTextField.resignFirstResponder()
    }
    else if secondTextField.isFirstResponder() {
      secondTextField.resignFirstResponder()
    }
  }
  
}
