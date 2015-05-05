//
//  FileManager.swift
//  SwiftFilePathExample
//
//  Created by Tim Fuqua on 4/30/15.
//  Copyright (c) 2015 FuquaProductions. All rights reserved.
//

import Foundation
import SwiftFilePath

private let _FileManagerSharedInstance = FileManager()
private let _DateFormatter: NSDateFormatter = {
  var df = NSDateFormatter()
  df.dateFormat = "yyyy-MM-dd HH:mm:ss"
  return df
}()

class FileManager {
  
  class var sharedInstance: FileManager {
    return _FileManagerSharedInstance
  }
  
  class var dateFormatter: NSDateFormatter {
    return _DateFormatter
  }
  
  var active: DataObject? = nil
  
  private let fileExt: String = ".sav"
  private let saveDir = Path.documentsDir
  
  init() {
  }
  
  func save() {
    if active != nil {
      if saveDir["\(active!.objectName)\(fileExt)"].exists {
        println("A file named " + saveDir["\(active!.objectName)\(fileExt)"].toString() + " already exists.")
        let existingObject = loadDataObject(active!.objectName)
        
        println("existingObject: \(existingObject!.createdOnDateString())")
        println("active: \(active!.createdOnDateString())")
        
        if existingObject!.createdOnDateString() == active!.createdOnDateString() {
          println("Both files have the same creation date. Overwriting.")
          // overwrite
          saveDir["\(active!.objectName)\(fileExt)"].writeString(active!.debugDescription)
        }
        else {
          println("The files have different creation dates. Disambiguating.")
          // save as disambiguated file
          let sections = active!.objectName.componentsSeparatedByString("[")
          
          // original filename, no [x] in filename
          if sections.count == 1 {
            println("The file has not been disambiguated yet.")
            // rename
            active!.objectName += "[1]"
            // attempt to save with new name
            save()
          }
          // already a disambiguated filename, contains [x]
          else if sections.count == 2 {
            println("The file has already been disambiguated before.")
            let numberString = sections[1].stringByReplacingOccurrencesOfString("]", withString: "", options: .LiteralSearch, range: nil)
            
            if let nextNumber = numberString.toInt() {
              // rename
              active!.objectName = sections[0] + "[\(nextNumber + 1)]"
              // attempt to save with new name
              save()
            }
          }
          else {
            println("sections.count: \(sections.count)")
          }
        }
      }
      else {
        println("No file exists with this name. Saving.")
        saveDir["\(active!.objectName)\(fileExt)"].touch()
        saveDir["\(active!.objectName)\(fileExt)"].writeString(active!.debugDescription)
      }
    }
  }
  
  func load(fromFile: String) -> Bool {
    if active == nil {
      active = DataObject()
    }
    
    if saveDir["\(fromFile)\(fileExt)"].exists {
      let data = saveDir["\(fromFile)\(fileExt)"].readString()!.componentsSeparatedByString("\n")

      if data.count == 4 {
        active!.createdOnDate = FileManager.dateFormatter.dateFromString(data[0])
        active!.objectName = data[1]
        active!.field1 = data[2]
        active!.field2 = data[3]
        return true
      }
      
      active = nil
      return false
    }
    
    active = nil
    return false
  }
  
  func loadDataObject(inout object: DataObject?, fromFile: String) {
    if saveDir["\(fromFile)\(fileExt)"].exists && object != nil {
      let data = saveDir["\(fromFile)\(fileExt)"].readString()!.componentsSeparatedByString("\n")
      
      if !object!.load(data) {
        object = nil
      }
    }
  }
  
  func loadDataObject(fromFile: String) -> DataObject? {
    if saveDir["\(fromFile)\(fileExt)"].exists {
      var tempObject = DataObject()
      let data = saveDir["\(fromFile)\(fileExt)"].readString()!.componentsSeparatedByString("\n")
      
      if tempObject.load(data) {
        println("tempObject loaded successfully. Returning tempObject.")
        return tempObject
      }
    }
    
    return nil
  }
  
}
