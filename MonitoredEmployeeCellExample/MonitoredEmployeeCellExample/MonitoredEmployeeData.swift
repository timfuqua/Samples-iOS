//
//  MonitoredEmployeeData.swift
//  MonitoredEmployeeCellExample
//
//  Created by Tim Fuqua on 1/16/15.
//  Copyright (c) 2015 FuquaProductions. All rights reserved.
//

import UIKit

class MonitoredEmployeeData {
    var name: String
    
    let ACDNameString: String = "ACD Name"
    let PositionString: String = "Position"
    let ACDStateString: String = "ACD State"
    let TimeInStateString: String = "Time in State"
    
    var ACDName: String
    var Position: String
    var ACDState: String
    var TimeInState: String
    
    init(name: String, acdName: String, position: String, acdState: String, timeInState: String) {
        self.name = name
        self.ACDName = acdName
        self.Position = position
        self.ACDState = acdState
        self.TimeInState = timeInState
    }

}