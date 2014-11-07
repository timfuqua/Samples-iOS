//
//  ViewController.swift
//  SampleUIObjects
//
//  Created by Tim Fuqua on 11/3/14.
//  Copyright (c) 2014 FallGuySamples. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let canvas = UIView(frame: CGRectMake(0, 0, 200, 200))
        canvas.backgroundColor = UIColor.redColor()
        
        if let xmlPath = NSBundle.mainBundle().pathForResource("SampleUI", ofType: "xml") {
            
            if let data = NSData(contentsOfFile: xmlPath) {
                
                // works only if data is successfully parsed
                // otherwise prints information about error with parsing
                var error: NSError?
                if let xmlDoc = AEXMLDocument(xmlData: data, error: &error) {
                    
                    // prints the same XML structure as original
                    println(xmlDoc.xmlString)
                    
                    // prints
                    for child in xmlDoc.rootElement.children {
                        
                        println(child.name)
                        
                        switch child.name {
                            
                        case "Label":
                            
                            var label: UILabel = UILabel()
                            label.textColor = UIColor.whiteColor()
                            
                            // check for the frame area
                            if var stringFrameArea: String = child.attributes["frame"] as? NSString {
                                
                                var stringFrameAreaArray: [String] = stringFrameArea.componentsSeparatedByString(" ")
                                label.frame = CGRect(x: stringFrameAreaArray[0].toInt()!, y: stringFrameAreaArray[1].toInt()!, width: stringFrameAreaArray[2].toInt()!, height: stringFrameAreaArray[3].toInt()!)
                            }
                            
                            // check for the title string
                            if var title = child.attributes["title"] as? NSString {
                                
                                label.text = title
                            }
                            
                            // check for the background color
                            if var bgcolor = child.attributes["bgcolor"] as? NSString {
                                
                                switch bgcolor {
                                
                                case "Blue":
                                    label.backgroundColor = UIColor.blueColor()
                                    
                                case let unknownColor:
                                    
                                    println("\(unknownColor) color not supported")
                                }
                            }

                            // add the object to the canvas
                            canvas.addSubview(label)
                            
                        case let unknownType:
                            
                            println("\(unknownType) type not recognized")
                        }
                    }
                }
                else {
                    
                    println("description: \(error?.localizedDescription)\ninfo: \(error?.userInfo)")
                }
            }
        }
        
        self.view.addSubview(canvas)
    }

    func buildUIFromXML(node: AEXMLElement, canvas: UIView) {
        
        
    }

}

