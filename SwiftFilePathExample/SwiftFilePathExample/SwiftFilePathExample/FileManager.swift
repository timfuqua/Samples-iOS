//
//  FileManager.swift
//  SwiftFilePathExample
//
//  Created by Tim Fuqua on 4/30/15.
//  Copyright (c) 2015 FuquaProductions. All rights reserved.
//

import Foundation
import SwiftFilePath

func matchesForRegexInText(regex: String!, text: String!) -> [String] {
  
  let regex = NSRegularExpression(pattern: regex, options: nil, error: nil)!
  let nsString = text as NSString
  let results = regex.matchesInString(text, options: nil, range: NSMakeRange(0, nsString.length)) as [NSTextCheckingResult]
  return map(results) { nsString.substringWithRange($0.range)}
}

class FileManager {
  
  var filenames: [String] = []
  
  private let baseName: String = "Data"
  private let fileExt: String = ".sav"
  private let saveDir = Path.documentsDir
  
  init() {
  }
  
  func saveDataObject(object: DataObject) {
    if saveDir["\(object.objectName)\(fileExt)"].exists {
      let existingObject = loadDataObject(saveDir["\(object.objectName)\(fileExt)"].toString())
      
      if existingObject.createdOnDate == object.createdOnDate {
        saveDir["\(object.objectName)\(fileExt)"].writeString(object.debugDescription)
      }
      else {
        if object.objectName.s
      }
    }
    else {
      saveDir["\(baseName)\(fileExt)"].touch()
      saveDir["\(baseName)\(fileExt)"].writeString(debugDescription)
    }
  }
  
  func loadDataObject(inout object: DataObject, fromFile: String) {
    
  }
  
  func loadDataObject(fromFile: String) -> DataObject {
    
    return DataObject()
  }
  
}
