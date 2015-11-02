//
//  ViewController.swift
//  NSCodingExample
//
//  Created by Tim Fuqua on 9/3/15.
//  Copyright (c) 2015 iSoftStone Inc. All rights reserved.
//

import UIKit

class ConfigurationOption: NSObject, NSCoding {
  
  var configurations: [String] = []
  var name: String = ""
  
  // NSCoding
  required convenience init(coder decoder: NSCoder) {
    self.init()
    
    decodeConfigurations(coder: decoder)
    decodeName(coder: decoder)
  }
  
  override init() {
    configurations = []
    name = ""
  }
  
  // NSCoding
  func encodeWithCoder(coder: NSCoder) {
    coder.encodeObject(configurations, forKey: "configurations")
    coder.encodeObject(name, forKey: "name")
  }
  
  init(configurations: [String], name: String) {
    self.configurations = configurations
    self.name = name
  }
  
  func getConfigurationOptionAsData() -> NSData {
    return NSKeyedArchiver.archivedDataWithRootObject(self)
  }
  
  private func decodeConfigurations(coder decoder: NSCoder) {
    configurations = (decoder.decodeObjectForKey("configurations") as! [String]?) ?? []
  }
  
  private func decodeName(coder decoder: NSCoder) {
    name = (decoder.decodeObjectForKey("name") as! String?) ?? ""
  }
  
}


class ViewController: UIViewController {
  
  var configurationOptions: [ConfigurationOption]? = nil
  
  override func viewDidLoad() {
    println("\nviewDidLoad")
    super.viewDidLoad()

    // MARK: Uncomment these lines to remove the configuration options stored in NSUserDefaults
//    println("Remove the configuration options from NSUserDefaults")
//    NSUserDefaults.standardUserDefaults().removeObjectForKey("configurationOptions")
    
    println("Attempting to load configuration options from NSUserDefaults")
    if let dataArray = NSUserDefaults.standardUserDefaults().objectForKey("configurationOptions") as? [NSData] {
      println("Configuration options found in NSUserDefaults")
      configurationOptions = []
      for data in dataArray {
        if let configurationOption = NSKeyedUnarchiver.unarchiveObjectWithData(data) as? ConfigurationOption {
          println("ConfigurationOption loaded!")
          configurationOptions!.append(configurationOption)
        }
      }
      println("Finished loading configuration options from NSUserDefaults")
    }
    else {
      println("No configuration options found")
    }

    printConfigurationOptions()
  }
  
  override func viewDidAppear(animated: Bool) {
    println("\nviewDidAppear")
    super.viewDidAppear(animated)

    archiveSomeConfigurationOptions()
    printConfigurationOptions()
  }
  
  func printConfigurationOptions() {
    println("\nPrinting configuration options")
    
    if configurationOptions == nil {
      println("No configuration options yet.")
      return
    }
    
    for configurationOption in configurationOptions! {
      print("configurationOption.configurations: [ ")
      
      for configuration in configurationOption.configurations {
        print("\(configuration) ")
      }
      
      println("]")
      
      println("configurationOption.name: \(configurationOption.name)")
    }
  }
  
  func archiveSomeConfigurationOptions() {
    if configurationOptions == nil {
      println("\nArchiving some sample configuration options")
      
      configurationOptions = []
      configurationOptions!.append(ConfigurationOption(configurations: ["config1", "config2"], name: "2 configuration options"))
      configurationOptions!.append(ConfigurationOption(configurations: ["config1", "config2", "config3"], name: "3 configuration options"))
      
      NSUserDefaults.standardUserDefaults().setObject(map(configurationOptions!, { return $0.getConfigurationOptionAsData() } ), forKey: "configurationOptions")
    }
    else {
      println("\nSome configuration options are already stored. Not storing anything this time.")
    }
  }
  
}

