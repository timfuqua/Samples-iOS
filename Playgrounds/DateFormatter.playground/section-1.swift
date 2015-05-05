// Playground - noun: a place where people can play

import UIKit

private func test1() {
  let inputDateString: String = "2015-05-04 15:06:16"
  //let inputDateString: String = ""

  let inputDateFormatter = NSDateFormatter()
  inputDateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"

  var inputDate = inputDateFormatter.dateFromString(inputDateString)

  if inputDate != nil {
    let outputDateStringFormatter = NSDateFormatter()
    outputDateStringFormatter.dateFormat = "MM/dd"
    var outputDate: String = outputDateStringFormatter.stringFromDate(inputDate!)
  }

  if inputDate != nil {
    let outputTimeStringFormatter = NSDateFormatter()
    outputTimeStringFormatter.dateFormat = "HH:mm:ss"
    var outputTime: String = outputTimeStringFormatter.stringFromDate(inputDate!)
  }
}

private func test2() {
  let inputDateString: String = "2015-05-04 15:06:16"
  //let inputDateString: String = ""
  
  let inputDateFormatter = NSDateFormatter()
  inputDateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
  
  var inputDate = inputDateFormatter.dateFromString(inputDateString)
  
  let stringFromDate = NSDateFormatter.localizedStringFromDate(inputDate!, dateStyle: NSDateFormatterStyle.LongStyle, timeStyle: NSDateFormatterStyle.ShortStyle)
  let dateFromString = inputDateFormatter.dateFromString(stringFromDate) // can't be done
  
}





test2()

