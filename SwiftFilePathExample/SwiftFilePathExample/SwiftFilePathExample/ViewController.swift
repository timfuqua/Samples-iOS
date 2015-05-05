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
  
  var sampleData: DataObject? = nil
  
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

    sampleData = DataObject()
    println(sampleData!.description)

    initializeTextFields()
    initializeFileContentsTextView()
  }
  
  override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
    fillOutData()
    view.endEditing(true)
    super.touchesBegan(touches, withEvent: event)
  }
  
  @IBAction func newButtonPressed(sender: UIButton) {
    clearOutAllData()
    sampleData = DataObject()
  }
  
  @IBAction func saveButtonPressed(sender: UIButton) {
    fillOutData()
    FileManager.sharedInstance.active = sampleData
    FileManager.sharedInstance.save()
  }
  
  @IBAction func loadButtonPressed(sender: UIButton) {
    fillOutData()
    if FileManager.sharedInstance.load(filenameTextField.text) {
      sampleData = FileManager.sharedInstance.active
      updateTextFields()
    }
    else {
      sampleData = nil
    }
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
    if sampleData != nil {
      println(sampleData!.description)
      fileContents.text = sampleData!.debugDescription
    }
    else {
      fileContents.text = ""
    }
  }
  
  private func updateTextFields() {
    if sampleData != nil {
      firstTextField.text = sampleData!.field1
      secondTextField.text = sampleData!.field2
      filenameTextField.text = sampleData!.objectName
    }
    else {
      firstTextField.text = ""
      secondTextField.text = ""
      filenameTextField.text = ""
    }
  }
  
  private func fillOutData() {
    if sampleData != nil {
      sampleData!.field1 = firstTextField.text
      sampleData!.field2 = secondTextField.text
      sampleData!.objectName = filenameTextField.text
    }
  }
  
  private func clearOutAllData() {
    sampleData = nil
    updateTextFields()
    updateTextView()
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
