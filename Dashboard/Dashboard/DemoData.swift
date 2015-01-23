//
//  DemoData.swift
//  Dashboard
//
//  Created by stephen zhou on 1/21/15.
//  Copyright (c) 2015 stephen zhou. All rights reserved.
//

import Foundation

class DemoData {

//    let ACDStates: [String] = ["ACDOUT", ""]
    
    var MEDataArray = [MonitoredEmployeeData]()
    var AlarmDataArray = [MonitoredEmployeeData]()

    var MECellDataArray = [CellData]()
    var AlarmCellDataArray = [CellData]()

    var demoMEDData: [[MonitoredEmployeeData]] = []
    var demoCellData: [[CellData]] = []
    
    init() {
//        initWithMED()
        initWithCellData()
    }
    
    func initWithCellData() {
//        var defaultArray: [String?] = ["DEFAULT", "DEFAULT", "DEFAULT", "DEFAULT"]
        var defaultArray: [String?] = [nil, nil, nil, nil]
        var empData: CellData = CellData()
        
        MECellDataArray.append(
            CellData(name: "Julie Andrews",
                left1: "HOLD", right1: randomTimeStamp(holdHour: "00")
            )
        )
        
        MECellDataArray.append(
            CellData(name: "Sam Smith",
                left1: "ACWOUT", right1: randomTimeStamp(holdHour: "01")
            )
        )
        
        MECellDataArray.append(
            CellData(name: "Julie Andrews",
                left1: "HOLD", right1: randomTimeStamp(holdHour: "00")
            )
        )
        
        MECellDataArray.append(
            CellData(name: "Sam Smith",
                left1: "ACWOUT", right1: randomTimeStamp(holdHour: "01")
            )
        )
        
        MECellDataArray.append(
            CellData(name: "Julie Andrews",
                left1: "HOLD", right1: randomTimeStamp(holdHour: "00")
            )
        )
        
        MECellDataArray.append(
            CellData(name: "Sam Smith",
                left1: "ACWOUT", right1: randomTimeStamp(holdHour: "01")
            )
        )
        
        
        
        AlarmCellDataArray.append(
            CellData(name: "Begin Shift Early",
                left1: "Julie Andrews", right1: randomTimeStamp(holdHour: "00"),
                left2: "Sam Smith", right2: randomTimeStamp(holdHour: "00")
            )
        )

        AlarmCellDataArray.append(
            CellData(name: "Begin Shift Early",
                left1: "Julie Andrews", right1: randomTimeStamp(holdHour: "00"),
                left2: "Sam Smith", right2: randomTimeStamp(holdHour: "00")
            )
        )
        
        AlarmCellDataArray.append(
            CellData(name: "Begin Shift Early",
                left1: "Julie Andrews", right1: randomTimeStamp(holdHour: "00"),
                left2: "Sam Smith", right2: randomTimeStamp(holdHour: "00")
            )
        )
        
        AlarmCellDataArray.append(
            CellData(name: "Begin Shift Early",
                left1: "Julie Andrews", right1: randomTimeStamp(holdHour: "00"),
                left2: "Sam Smith", right2: randomTimeStamp(holdHour: "00")
            )
        )
        
        AlarmCellDataArray.append(
            CellData(name: "Begin Shift Early",
                left1: "Julie Andrews", right1: randomTimeStamp(holdHour: "00"),
                left2: "Sam Smith", right2: randomTimeStamp(holdHour: "00")
            )
        )
        
        AlarmCellDataArray.append(
            CellData(name: "Begin Shift Early",
                left1: "Julie Andrews", right1: randomTimeStamp(holdHour: "00"),
                left2: "Sam Smith", right2: randomTimeStamp(holdHour: "00")
            )
        )
        
        AlarmCellDataArray.append(
            CellData(name: "Begin Shift Early",
                left1: "Julie Andrews", right1: randomTimeStamp(holdHour: "00"),
                left2: "Sam Smith", right2: randomTimeStamp(holdHour: "00")
            )
        )
        
        AlarmCellDataArray.append(
            CellData(name: "Begin Shift Early",
                left1: "Julie Andrews", right1: randomTimeStamp(holdHour: "00"),
                left2: "Sam Smith", right2: randomTimeStamp(holdHour: "00")
            )
        )
        
        AlarmCellDataArray.append(
            CellData(name: "Begin Shift Early",
                left1: "Julie Andrews", right1: randomTimeStamp(holdHour: "00"),
                left2: "Sam Smith", right2: randomTimeStamp(holdHour: "00")
            )
        )
        
        AlarmCellDataArray.append(
            CellData(name: "Begin Shift Early",
                left1: "Julie Andrews", right1: randomTimeStamp(holdHour: "00"),
                left2: "Sam Smith", right2: randomTimeStamp(holdHour: "00")
            )
        )
        
        AlarmCellDataArray.append(
            CellData(name: "Begin Shift Early",
                left1: "Julie Andrews", right1: randomTimeStamp(holdHour: "00"),
                left2: "Sam Smith", right2: randomTimeStamp(holdHour: "00")
            )
        )
        
        AlarmCellDataArray.append(
            CellData(name: "Begin Shift Early",
                left1: "Julie Andrews", right1: randomTimeStamp(holdHour: "00"),
                left2: "Sam Smith", right2: randomTimeStamp(holdHour: "00")
            )
        )
        
        AlarmCellDataArray.append(
            CellData(name: "Begin Shift Early",
                left1: "Julie Andrews", right1: randomTimeStamp(holdHour: "00"),
                left2: "Sam Smith", right2: randomTimeStamp(holdHour: "00")
            )
        )
        
        AlarmCellDataArray.append(
            CellData(name: "Begin Shift Early",
                left1: "Julie Andrews", right1: randomTimeStamp(holdHour: "00"),
                left2: "Sam Smith", right2: randomTimeStamp(holdHour: "00")
            )
        )
        
        AlarmCellDataArray.append(
            CellData(name: "Begin Shift Early",
                left1: "Julie Andrews", right1: randomTimeStamp(holdHour: "00"),
                left2: "Sam Smith", right2: randomTimeStamp(holdHour: "00")
            )
        )
        
        AlarmCellDataArray.append(
            CellData(name: "Begin Shift Early",
                left1: "Julie Andrews", right1: randomTimeStamp(holdHour: "00"),
                left2: "Sam Smith", right2: randomTimeStamp(holdHour: "00")
            )
        )
        
        AlarmCellDataArray.append(
            CellData(name: "Begin Shift Early",
                left1: "Julie Andrews", right1: randomTimeStamp(holdHour: "00"),
                left2: "Sam Smith", right2: randomTimeStamp(holdHour: "00")
            )
        )
        
        AlarmCellDataArray.append(
            CellData(name: "Begin Shift Early",
                left1: "Julie Andrews", right1: randomTimeStamp(holdHour: "00"),
                left2: "Sam Smith", right2: randomTimeStamp(holdHour: "00")
            )
        )
        
        demoCellData.append(MECellDataArray)
        demoCellData.append(AlarmCellDataArray)

    }
    
    func initWithMED() {
        var cellData1: MonitoredEmployeeData = MonitoredEmployeeData(name: "Julie Andrews", acdName: "DEFAULT", position: "DEFAULT", acdState: "DEFAULT", timeInState: "DEFAULT")
        MEDataArray.append(cellData1)
        
        var cellData2: MonitoredEmployeeData = MonitoredEmployeeData(name: "Sam Smith", acdName: "DEFAULT", position: "DEFAULT", acdState: "DEFAULT", timeInState: "DEFAULT")
        MEDataArray.append(cellData2)
        
        var cellData3: MonitoredEmployeeData = MonitoredEmployeeData(name: "John Andrews", acdName: "DEFAULT", position: "DEFAULT", acdState: "DEFAULT", timeInState: "DEFAULT")
        MEDataArray.append(cellData3)
        
        var cellData4: MonitoredEmployeeData = MonitoredEmployeeData(name: "Sally Field", acdName: "DEFAULT", position: "DEFAULT", acdState: "DEFAULT", timeInState: "DEFAULT")
        MEDataArray.append(cellData4)
        
        var cellData5: MonitoredEmployeeData = MonitoredEmployeeData(name: "Jesse Simons", acdName: "DEFAULT", position: "DEFAULT", acdState: "DEFAULT", timeInState: "DEFAULT")
        MEDataArray.append(cellData5)
        
        var cellData6: MonitoredEmployeeData = MonitoredEmployeeData(name: "Sam Smith", acdName: "DEFAULT", position: "DEFAULT", acdState: "DEFAULT", timeInState: "DEFAULT")
        MEDataArray.append(cellData6)
        
        
        var alarmData1: MonitoredEmployeeData = MonitoredEmployeeData(name: "Begin Shift Early", acdName: "DEFAULT", position: "DEFAULT", acdState: "DEFAULT", timeInState: "DEFAULT")
        AlarmDataArray.append(alarmData1)
        
        var alarmData2: MonitoredEmployeeData = MonitoredEmployeeData(name: "Begin Break Late", acdName: "DEFAULT", position: "DEFAULT", acdState: "DEFAULT", timeInState: "DEFAULT")
        AlarmDataArray.append(alarmData2)
        
        var alarmData3: MonitoredEmployeeData = MonitoredEmployeeData(name: "Begin Exception Early", acdName: "DEFAULT", position: "DEFAULT", acdState: "DEFAULT", timeInState: "DEFAULT")
        AlarmDataArray.append(alarmData3)
        
        var alarmData4: MonitoredEmployeeData = MonitoredEmployeeData(name: "Begin Shift Early", acdName: "DEFAULT", position: "DEFAULT", acdState: "DEFAULT", timeInState: "DEFAULT")
        AlarmDataArray.append(alarmData4)
        
        var alarmData5: MonitoredEmployeeData = MonitoredEmployeeData(name: "Begin Break Early", acdName: "DEFAULT", position: "DEFAULT", acdState: "DEFAULT", timeInState: "DEFAULT")
        AlarmDataArray.append(alarmData5)
        
        var alarmData6: MonitoredEmployeeData = MonitoredEmployeeData(name: "Begin Exception Early", acdName: "DEFAULT", position: "DEFAULT", acdState: "DEFAULT", timeInState: "DEFAULT")
        AlarmDataArray.append(alarmData5)
        
        var alarmData7: MonitoredEmployeeData = MonitoredEmployeeData(name: "Begin Shift Early", acdName: "DEFAULT", position: "DEFAULT", acdState: "DEFAULT", timeInState: "DEFAULT")
        AlarmDataArray.append(alarmData7)
        
        var alarmData8: MonitoredEmployeeData = MonitoredEmployeeData(name: "Begin Break Late", acdName: "DEFAULT", position: "DEFAULT", acdState: "DEFAULT", timeInState: "DEFAULT")
        AlarmDataArray.append(alarmData8)
        
        var alarmData9: MonitoredEmployeeData = MonitoredEmployeeData(name: "Begin Exception Early", acdName: "DEFAULT", position: "DEFAULT", acdState: "DEFAULT", timeInState: "DEFAULT")
        AlarmDataArray.append(alarmData9)
        
        var alarmData10: MonitoredEmployeeData = MonitoredEmployeeData(name: "Begin Shift Early", acdName: "DEFAULT", position: "DEFAULT", acdState: "DEFAULT", timeInState: "DEFAULT")
        AlarmDataArray.append(alarmData10)
        
        var alarmData11: MonitoredEmployeeData = MonitoredEmployeeData(name: "Begin Break Late", acdName: "DEFAULT", position: "DEFAULT", acdState: "DEFAULT", timeInState: "DEFAULT")
        AlarmDataArray.append(alarmData11)
        
        var alarmData12: MonitoredEmployeeData = MonitoredEmployeeData(name: "Begin Exception Early", acdName: "DEFAULT", position: "DEFAULT", acdState: "DEFAULT", timeInState: "DEFAULT")
        AlarmDataArray.append(alarmData12)
        
        var alarmData13: MonitoredEmployeeData = MonitoredEmployeeData(name: "Begin Shift Early", acdName: "DEFAULT", position: "DEFAULT", acdState: "DEFAULT", timeInState: "DEFAULT")
        AlarmDataArray.append(alarmData13)
        
        var alarmData14: MonitoredEmployeeData = MonitoredEmployeeData(name: "Begin Break Late", acdName: "DEFAULT", position: "DEFAULT", acdState: "DEFAULT", timeInState: "DEFAULT")
        AlarmDataArray.append(alarmData14)
        
        var alarmData15: MonitoredEmployeeData = MonitoredEmployeeData(name: "Begin Exception Early", acdName: "DEFAULT", position: "DEFAULT", acdState: "DEFAULT", timeInState: "DEFAULT")
        AlarmDataArray.append(alarmData15)
        
        var alarmData16: MonitoredEmployeeData = MonitoredEmployeeData(name: "Begin Shift Early", acdName: "DEFAULT", position: "DEFAULT", acdState: "DEFAULT", timeInState: "DEFAULT")
        AlarmDataArray.append(alarmData16)
        
        var alarmData17: MonitoredEmployeeData = MonitoredEmployeeData(name: "Begin Break Late", acdName: "DEFAULT", position: "DEFAULT", acdState: "DEFAULT", timeInState: "DEFAULT")
        AlarmDataArray.append(alarmData17)
        
        var alarmData18: MonitoredEmployeeData = MonitoredEmployeeData(name: "Begin Exception Early", acdName: "DEFAULT", position: "DEFAULT", acdState: "DEFAULT", timeInState: "DEFAULT")
        AlarmDataArray.append(alarmData18)
        
        //        var alarmData19: MonitoredEmployeeData = MonitoredEmployeeData(name: "Begin Shift Early", acdName: "DEFAULT", position: "DEFAULT", acdState: "DEFAULT", timeInState: "DEFAULT")
        //        AlarmDataArray.append(alarmData19)
        //
        //        var alarmData2: MonitoredEmployeeData = MonitoredEmployeeData(name: "Begin Break Late", acdName: "DEFAULT", position: "DEFAULT", acdState: "DEFAULT", timeInState: "DEFAULT")
        //        AlarmDataArray.append(alarmData2)
        //
        //        var alarmData3: MonitoredEmployeeData = MonitoredEmployeeData(name: "Begin Exception Early", acdName: "DEFAULT", position: "DEFAULT", acdState: "DEFAULT", timeInState: "DEFAULT")
        //
        //        var alarmData1: MonitoredEmployeeData = MonitoredEmployeeData(name: "Begin Shift Early", acdName: "DEFAULT", position: "DEFAULT", acdState: "DEFAULT", timeInState: "DEFAULT")
        //        AlarmDataArray.append(alarmData1)
        //
        //        var alarmData2: MonitoredEmployeeData = MonitoredEmployeeData(name: "Begin Break Late", acdName: "DEFAULT", position: "DEFAULT", acdState: "DEFAULT", timeInState: "DEFAULT")
        //        AlarmDataArray.append(alarmData2)
        //
        //        var alarmData3: MonitoredEmployeeData = MonitoredEmployeeData(name: "Begin Exception Early", acdName: "DEFAULT", position: "DEFAULT", acdState: "DEFAULT", timeInState: "DEFAULT")
        //        AlarmDataArray.append(alarmData3)
        
        demoMEDData.insert(MEDataArray, atIndex: 0)
        demoMEDData.insert(AlarmDataArray, atIndex: 1)
        
        //        printDemoData()
    }
    
    func randomTimeStamp(holdHour: String? = nil, holdMinute: String? = nil, holdSecond: String? = nil) -> String {
        var hourString: String? = {
            if holdHour != nil {
                return holdHour
            }
            else {
                var tens: Int = Int(arc4random_uniform(10))
                var ones: Int = Int(arc4random_uniform(10))
                return "\(tens)\(ones)"
            }
        }()
        
        var minuteString: String? = {
            if holdMinute != nil {
                return holdMinute
            }
            else {
                var tens: Int = Int(arc4random_uniform(6))
                var ones: Int = Int(arc4random_uniform(10))
                return "\(tens)\(ones)"
            }
            }()
        
        var secondString: String? = {
            if holdSecond != nil {
                return holdSecond
            }
            else {
                var tens: Int = Int(arc4random_uniform(6))
                var ones: Int = Int(arc4random_uniform(10))
                return "\(tens)\(ones)"
            }
            }()
        
        return "\(hourString!):\(minuteString!):\(secondString!)"
    }
    
    func printDemoData() {
        for dataArray in demoMEDData {
            for data in dataArray {
                println(data.name)
            }
        }
    }

    func printCellDemoData() {
        for dataArray in demoCellData {
            for data in dataArray {
                println(data.name)
            }
        }
    }
}
