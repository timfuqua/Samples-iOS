//
//  DataModel.swift
//  SwiftFilePathExample
//
//  Created by Tim Fuqua on 4/30/15.
//  Copyright (c) 2015 FuquaProductions. All rights reserved.
//

import Foundation
import SwiftFilePath

class Data {
  
  private let baseName: String = "Data"
  private let fileExt: String = ".sav"
  private let saveDir = Path.documentsDir
  
  var field1: String = ""
  var field2: String = ""
  
  init() {
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
      
      if data.count == 2 {
        field1 = data[0]
        field2 = data[1]
        return true
      }
    }
    
    return false
  }
  
}

extension Data: Printable {
  
  var description: String {
    get {
      var dataDescription: String = ""
      
      dataDescription += "Field1: \(field1)\t\t"
      dataDescription += "Field2: \(field2)"
      
      return dataDescription
    }
  }
  
  var debugDescription: String {
    get {
      var debugDescription: String = ""
      
      debugDescription += "\(field1)\n"
      debugDescription += "\(field2)"
      
      return debugDescription
    }
  }
  
}
