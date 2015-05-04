//
//  DataFile.swift
//  SwiftFilePathExample
//
//  Created by Tim Fuqua on 4/30/15.
//  Copyright (c) 2015 FuquaProductions. All rights reserved.
//

import Foundation
import SwiftFilePath

class DataFile<T> {
  
  let data: T
  var filename: String = ""

  init(data: T, filename: String) {
    self.data = data
    self.filename = filename
  }
  
//  func save() {
//    if saveDir["\(baseName)\(fileExt)"].exists {
//      saveDir["\(baseName)\(fileExt)"].writeString(debugDescription)
//    }
//    else {
//      saveDir["\(baseName)\(fileExt)"].touch()
//      saveDir["\(baseName)\(fileExt)"].writeString(debugDescription)
//    }
//  }
//  
//  func load() -> Bool {
//    if saveDir["\(baseName)\(fileExt)"].exists {
//      let data = saveDir["\(baseName)\(fileExt)"].readString()!.componentsSeparatedByString("\n")
//      
//      if data.count == 2 {
//        field1 = data[0]
//        field2 = data[1]
//        return true
//      }
//    }
//    
//    return false
//  }
  
}
