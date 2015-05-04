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
private var _activeDataObject = DataObject()

class FileManager {
  
  class var sharedInstance: FileManager {
    return _FileManagerSharedInstance
  }
  
  class var active: DataObject {
    return _activeDataObject
  }
  
//  var filenames: [String] = []
  
//  private let baseName: String = "Data"
  private let fileExt: String = ".sav"
  private let saveDir = Path.documentsDir
  
  init() {
  }
  
  func save() {
    if saveDir["\(FileManager.active.objectName)\(fileExt)"].exists {
      let existingObject = loadDataObject(saveDir["\(FileManager.active.objectName)\(fileExt)"].toString())
      
      if existingObject.createdOnDate == FileManager.active.createdOnDate {
        // overwrite
        saveDir["\(FileManager.active.objectName)\(fileExt)"].writeString(FileManager.active.debugDescription)
      }
      else {
        // save as disambiguated file
        let sections = FileManager.active.objectName.componentsSeparatedByString("[")
        
        // original filename, no [x] in filename
        if sections.count == 0 {
          // rename
          FileManager.active.objectName += "[1]"
          // attempt to save with new name
          save()
        }
          // already a disambiguated filename, contains [x]
        else if sections.count == 2 {
          let numberString = sections[1].stringByReplacingOccurrencesOfString("]", withString: "", options: .LiteralSearch, range: nil)
          
          if let nextNumber = numberString.toInt() {
            // rename
            FileManager.active.objectName = sections[0] + "[\(nextNumber + 1)]"
            // attempt to save with new name
            save()
          }
        }
      }
    }
    else {
      saveDir["\(FileManager.active.objectName)\(fileExt)"].touch()
      saveDir["\(FileManager.active.objectName)\(fileExt)"].writeString(FileManager.active.debugDescription)
    }
  }
  
  func load(fromFile: String) -> Bool {
    if saveDir["\(FileManager.active.objectName)\(fileExt)"].exists {
      let data = saveDir["\(FileManager.active.objectName)\(fileExt)"].readString()!.componentsSeparatedByString("\n")

      if data.count == 4 {
        let creationDateString = data[0]
        FileManager.active.objectName = data[1]
        FileManager.active.field1 = data[2]
        FileManager.active.field2 = data[3]
        return true
      }
    }
    
    return false
  }
  
  func saveDataObject(object: DataObject) {
    if saveDir["\(object.objectName)\(fileExt)"].exists {
      let existingObject = loadDataObject(saveDir["\(object.objectName)\(fileExt)"].toString())
      
      if existingObject.createdOnDate == object.createdOnDate {
        // overwrite
        saveDir["\(object.objectName)\(fileExt)"].writeString(object.debugDescription)
      }
      else {
        // save as disambiguated file
        let sections = object.objectName.componentsSeparatedByString("[")
        
        // original filename, no [x] in filename
        if sections.count == 0 {
          // rename
          object.objectName += "[1]"
          // attempt to save with new name
          saveDataObject(object)
        }
        // already a disambiguated filename, contains [x]
        else if sections.count == 2 {
          let numberString = sections[1].stringByReplacingOccurrencesOfString("]", withString: "", options: .LiteralSearch, range: nil)
          
          if let nextNumber = numberString.toInt() {
            // rename
            object.objectName = sections[0] + "[\(nextNumber + 1)]"
            // attempt to save with new name
            saveDataObject(object)
          }
        }
      }
    }
    else {
      saveDir["\(object.objectName)\(fileExt)"].touch()
      saveDir["\(object.objectName)\(fileExt)"].writeString(object.debugDescription)
    }
  }
  
  func loadDataObject(inout object: DataObject, fromFile: String) {
    
  }
  
  func loadDataObject(fromFile: String) -> DataObject {
    
    return DataObject()
  }
  
}
