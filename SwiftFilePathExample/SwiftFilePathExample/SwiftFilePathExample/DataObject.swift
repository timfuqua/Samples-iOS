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

  func load(fromData: [String]) -> Bool {
    
    if fromData.count == 4 {
      createdOnDate = FileManager.dateFormatter.dateFromString(fromData[0])
      objectName = fromData[1]
      field1 = fromData[2]
      field2 = fromData[3]
      return true
    }
    else {
      return false
    }
  }
  
  func createdOnDateString() -> String {
    if createdOnDate != nil {
      return FileManager.dateFormatter.stringFromDate(createdOnDate!)
    }
    return ""
  }
  
}

extension DataObject: Printable {
  
  var description: String {
    get {
      var dataDescription: String = ""
      
      
      dataDescription += "Created On: \(FileManager.dateFormatter.stringFromDate(createdOnDate!))\t\t"
      dataDescription += "Object Name: \(objectName)\t\t"
      dataDescription += "Field1: \(field1)\t\t"
      dataDescription += "Field2: \(field2)"
      
      return dataDescription
    }
  }
  
  var debugDescription: String {
    get {
      var debugDescription: String = ""
      
      debugDescription += "\(FileManager.dateFormatter.stringFromDate(createdOnDate!))\n"
      debugDescription += "\(objectName)\n"
      debugDescription += "\(field1)\n"
      debugDescription += "\(field2)"
      
      return debugDescription
    }
  }
  
}
