//
//  DataObject.swift
//  SwiftFilePathExample
//
//  Created by Tim Fuqua on 4/30/15.
//  Copyright (c) 2015 FuquaProductions. All rights reserved.
//

import Foundation
import SwiftFilePath

class DataObject {
  
  var createdOnDate: NSDate? = nil
  var objectName: String = ""
  var field1: String = ""
  var field2: String = ""
  
  init() {
    createdOnDate = NSDate()
  }
  
  func save() {
    if saveDir["\(baseName)\(fileExt)"].exists {
      saveDir["\(baseName)\(fileExt)"].writeString(debugDescription)
    }
    else {
      saveDir["\(baseName)\(fileExt)"].touch()
      saveDir["\(baseName)\(fileExt)"].writeString(debugDescription)
    }
  }
  
  func load() -> Bool {
    if saveDir["\(baseName)\(fileExt)"].exists {
      let data = saveDir["\(baseName)\(fileExt)"].readString()!.componentsSeparatedByString("\n")
      
      if data.count == 3 {
        objectName = data[0]
        field1 = data[1]
        field2 = data[2]
        return true
      }
    }
    
    return false
  }
  
}

extension DataObject: Printable {
  
  var description: String {
    get {
      var dataDescription: String = ""
      
      dataDescription += "Object Name: \(objectName)\t\t"
      dataDescription += "Field1: \(field1)\t\t"
      dataDescription += "Field2: \(field2)"
      
      return dataDescription
    }
  }
  
  var debugDescription: String {
    get {
      var debugDescription: String = ""
      
      debugDescription += "\(objectName)\n"
      debugDescription += "\(field1)\n"
      debugDescription += "\(field2)"
      
      return debugDescription
    }
  }
  
}
