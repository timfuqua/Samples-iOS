// Playground - noun: a place where people can play

import UIKit

private let _DateFormatter: NSDateFormatter = {
  var df = NSDateFormatter()
  df.dateFormat = "yyyy-MM-dd HH:mm:ss"
  return df
  }()

class TimeUtility {
  
  class var dateFormatter: NSDateFormatter {
    return _DateFormatter
  }
  
  class func extractDateAndTimeUsingFormats(inout date: String, inputDateFormat: String, outputDateFormat: String, inout time: String, inputTimeFormat: String, outputTimeFormat: String, timestamp: String) {
    if timestamp == "" {
      date = ""
      time = ""
      return
    }
    
    let inputDateFormatter = NSDateFormatter()
    inputDateFormatter.dateFormat = inputDateFormat + " " + inputTimeFormat
    
    var inputDate = inputDateFormatter.dateFromString(timestamp)
    
    if inputDate != nil {
      let outputDateStringFormatter = NSDateFormatter()
      outputDateStringFormatter.dateFormat = outputDateFormat
      date = outputDateStringFormatter.stringFromDate(inputDate!)
    }
    
    if inputDate != nil {
      let outputTimeStringFormatter = NSDateFormatter()
      outputTimeStringFormatter.dateFormat = outputTimeFormat
      time = outputTimeStringFormatter.stringFromDate(inputDate!)
    }
  }
  
  class func extractDateUsingFormats(inout date: String, inputDateFormat: String, outputDateFormat: String, timestamp: String) {
    if timestamp == "" {
      date = ""
      return
    }
    
    let inputDateFormatter = NSDateFormatter()
    inputDateFormatter.dateFormat = inputDateFormat
    
    var inputDate = inputDateFormatter.dateFromString(timestamp)
    
    if inputDate != nil {
      let outputDateStringFormatter = NSDateFormatter()
      outputDateStringFormatter.dateFormat = outputDateFormat
      date = outputDateStringFormatter.stringFromDate(inputDate!)
    }
  }
  
  class func extractTimeUsingFormats(inout time: String, inputTimeFormat: String, outputTimeFormat: String, timestamp: String) {
    if timestamp == "" {
      time = ""
      return
    }
    
    let inputDateFormatter = NSDateFormatter()
    inputDateFormatter.dateFormat = inputTimeFormat
    
    var inputDate = inputDateFormatter.dateFromString(timestamp)
    
    if inputDate != nil {
      let outputTimeStringFormatter = NSDateFormatter()
      outputTimeStringFormatter.dateFormat = outputTimeFormat
      time = outputTimeStringFormatter.stringFromDate(inputDate!)
    }
  }
  
}

func ==(lhs: NSDate, rhs: NSDate) -> Bool {
  return lhs.compare(rhs) == .OrderedSame
}

func <(lhs: NSDate, rhs: NSDate) -> Bool {
  return lhs.compare(rhs) == .OrderedAscending
}

func >(lhs: NSDate, rhs: NSDate) -> Bool {
  return lhs.compare(rhs) == .OrderedDescending
}

extension NSDate {
  
  func isEqualTo(dateToCompare: NSDate) -> Bool {
    return self == dateToCompare
  }
  
  func isLessThan(dateToCompare: NSDate) -> Bool {
    return self < dateToCompare
  }
  
  func isGreaterThan(dateToCompare: NSDate) -> Bool {
    return self > dateToCompare
  }
  
  func isDayOfMonthEqual(otherDate: NSDate) -> Bool {
    return NSCalendar.currentCalendar().component(NSCalendarUnit.CalendarUnitDay, fromDate: self) ==
      NSCalendar.currentCalendar().component(NSCalendarUnit.CalendarUnitDay, fromDate: otherDate)
  }
  
  func isMonthEqual(otherDate: NSDate) -> Bool {
    return NSCalendar.currentCalendar().component(NSCalendarUnit.CalendarUnitMonth, fromDate: self) ==
      NSCalendar.currentCalendar().component(NSCalendarUnit.CalendarUnitMonth, fromDate: otherDate)
  }
  
  func isYearEqual(otherDate: NSDate) -> Bool {
    return NSCalendar.currentCalendar().component(NSCalendarUnit.CalendarUnitYear, fromDate: self) ==
      NSCalendar.currentCalendar().component(NSCalendarUnit.CalendarUnitYear, fromDate: otherDate)
  }
  
  func isDateEqual(otherDate: NSDate) -> Bool {
    return NSCalendar.currentCalendar().components(NSCalendarUnit.CalendarUnitDay | NSCalendarUnit.CalendarUnitMonth | NSCalendarUnit.CalendarUnitYear, fromDate: self) ==
      NSCalendar.currentCalendar().components(NSCalendarUnit.CalendarUnitDay | NSCalendarUnit.CalendarUnitMonth | NSCalendarUnit.CalendarUnitYear, fromDate: otherDate)
  }
  
  func dayOfWeek() -> Int {
    let myCalendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)!
    let myComponents = myCalendar.components(.CalendarUnitWeekday, fromDate: self)
    let weekDay = myComponents.weekday
    
    return weekDay
  }
  
  func dayOfWeekAsString() -> String {
    switch self.dayOfWeek() {
    case 1:
      return "Sunday"
    case 2:
      return "Monday"
    case 3:
      return "Tuesday"
    case 4:
      return "Wednesday"
    case 5:
      return "Thursday"
    case 6:
      return "Friday"
    case 7:
      return "Saturday"
    default:
      return "Not a day of the week. This should never happen."
    }
  }
  
  func timeShiftedByNumberOfDays(numDays: Int) -> NSDate? {
    var dateComponent: NSDateComponents = NSDateComponents()
    dateComponent.day = numDays
    var currentCalendar: NSCalendar = NSCalendar.currentCalendar()
    var nextDate = currentCalendar.dateByAddingComponents(dateComponent, toDate: self, options: nil)
    
    return nextDate
  }
  
  func timeShiftedByNumberOfHours(numHours: Int) -> NSDate? {
    var dateComponent: NSDateComponents = NSDateComponents()
    dateComponent.hour = numHours
    var currentCalendar: NSCalendar = NSCalendar.currentCalendar()
    var nextDate = currentCalendar.dateByAddingComponents(dateComponent, toDate: self, options: nil)
    
    return nextDate
  }
  
}

func test01() {
  let currentTime = NSDate()
  
  NSDateFormatter.localizedStringFromDate(currentTime, dateStyle: NSDateFormatterStyle.NoStyle, timeStyle: NSDateFormatterStyle.NoStyle)
  NSDateFormatter.localizedStringFromDate(currentTime, dateStyle: NSDateFormatterStyle.NoStyle, timeStyle: NSDateFormatterStyle.ShortStyle)
  NSDateFormatter.localizedStringFromDate(currentTime, dateStyle: NSDateFormatterStyle.NoStyle, timeStyle: NSDateFormatterStyle.MediumStyle)
  NSDateFormatter.localizedStringFromDate(currentTime, dateStyle: NSDateFormatterStyle.NoStyle, timeStyle: NSDateFormatterStyle.LongStyle)
  NSDateFormatter.localizedStringFromDate(currentTime, dateStyle: NSDateFormatterStyle.NoStyle, timeStyle: NSDateFormatterStyle.FullStyle)
  
  NSDateFormatter.localizedStringFromDate(currentTime, dateStyle: NSDateFormatterStyle.ShortStyle, timeStyle: NSDateFormatterStyle.NoStyle)
  NSDateFormatter.localizedStringFromDate(currentTime, dateStyle: NSDateFormatterStyle.ShortStyle, timeStyle: NSDateFormatterStyle.ShortStyle)
  NSDateFormatter.localizedStringFromDate(currentTime, dateStyle: NSDateFormatterStyle.ShortStyle, timeStyle: NSDateFormatterStyle.MediumStyle)
  NSDateFormatter.localizedStringFromDate(currentTime, dateStyle: NSDateFormatterStyle.ShortStyle, timeStyle: NSDateFormatterStyle.LongStyle)
  NSDateFormatter.localizedStringFromDate(currentTime, dateStyle: NSDateFormatterStyle.ShortStyle, timeStyle: NSDateFormatterStyle.FullStyle)
  
  NSDateFormatter.localizedStringFromDate(currentTime, dateStyle: NSDateFormatterStyle.MediumStyle, timeStyle: NSDateFormatterStyle.NoStyle)
  NSDateFormatter.localizedStringFromDate(currentTime, dateStyle: NSDateFormatterStyle.MediumStyle, timeStyle: NSDateFormatterStyle.ShortStyle)
  NSDateFormatter.localizedStringFromDate(currentTime, dateStyle: NSDateFormatterStyle.MediumStyle, timeStyle: NSDateFormatterStyle.MediumStyle)
  NSDateFormatter.localizedStringFromDate(currentTime, dateStyle: NSDateFormatterStyle.MediumStyle, timeStyle: NSDateFormatterStyle.LongStyle)
  NSDateFormatter.localizedStringFromDate(currentTime, dateStyle: NSDateFormatterStyle.MediumStyle, timeStyle: NSDateFormatterStyle.FullStyle)
  
  NSDateFormatter.localizedStringFromDate(currentTime, dateStyle: NSDateFormatterStyle.LongStyle, timeStyle: NSDateFormatterStyle.NoStyle)
  NSDateFormatter.localizedStringFromDate(currentTime, dateStyle: NSDateFormatterStyle.LongStyle, timeStyle: NSDateFormatterStyle.ShortStyle)
  NSDateFormatter.localizedStringFromDate(currentTime, dateStyle: NSDateFormatterStyle.LongStyle, timeStyle: NSDateFormatterStyle.MediumStyle)
  NSDateFormatter.localizedStringFromDate(currentTime, dateStyle: NSDateFormatterStyle.LongStyle, timeStyle: NSDateFormatterStyle.LongStyle)
  NSDateFormatter.localizedStringFromDate(currentTime, dateStyle: NSDateFormatterStyle.LongStyle, timeStyle: NSDateFormatterStyle.FullStyle)
  
  NSDateFormatter.localizedStringFromDate(currentTime, dateStyle: NSDateFormatterStyle.FullStyle, timeStyle: NSDateFormatterStyle.NoStyle)
  NSDateFormatter.localizedStringFromDate(currentTime, dateStyle: NSDateFormatterStyle.FullStyle, timeStyle: NSDateFormatterStyle.ShortStyle)
  NSDateFormatter.localizedStringFromDate(currentTime, dateStyle: NSDateFormatterStyle.FullStyle, timeStyle: NSDateFormatterStyle.MediumStyle)
  NSDateFormatter.localizedStringFromDate(currentTime, dateStyle: NSDateFormatterStyle.FullStyle, timeStyle: NSDateFormatterStyle.LongStyle)
  NSDateFormatter.localizedStringFromDate(currentTime, dateStyle: NSDateFormatterStyle.FullStyle, timeStyle: NSDateFormatterStyle.FullStyle)
}

func test02() {
  
  let currentDate = NSDate()
  
  println("Current")
  println(currentDate)
  println(currentDate.dayOfWeek())
  println(currentDate.dayOfWeekAsString())
  
  let future6Hours = currentDate.timeShiftedByNumberOfHours(6)!
  println("")
  println("Future 6 hours")
  println(future6Hours)
  println(future6Hours.dayOfWeek())
  println(future6Hours.dayOfWeekAsString())
  
  let future12Hours = currentDate.timeShiftedByNumberOfHours(12)!
  println("")
  println("Future 12 hours")
  println(future12Hours)
  println(future12Hours.dayOfWeek())
  println(future12Hours.dayOfWeekAsString())
  
  let dateAsString: String = NSDateFormatter.localizedStringFromDate(currentDate, dateStyle: NSDateFormatterStyle.FullStyle, timeStyle: NSDateFormatterStyle.NoStyle)
  let day: String = dateAsString.componentsSeparatedByString(",")[0]
  
  println("")
  println("Current using localizedStringFromDate")
  println(dateAsString)
  println(day)
  
  let future6HoursAsString = NSDateFormatter.localizedStringFromDate(future6Hours, dateStyle: NSDateFormatterStyle.FullStyle, timeStyle: NSDateFormatterStyle.NoStyle)
  let future6HoursAsStringDay = future6HoursAsString.componentsSeparatedByString(",")[0]
  println("")
  println("Future 6 hours using localizedStringFromDate")
  println(future6HoursAsString)
  println(future6HoursAsStringDay)
  
  let future12HoursAsString = NSDateFormatter.localizedStringFromDate(future12Hours, dateStyle: NSDateFormatterStyle.FullStyle, timeStyle: NSDateFormatterStyle.NoStyle)
  let future12HoursAsStringDay = future12HoursAsString.componentsSeparatedByString(",")[0]
  println("")
  println("Future 12 hours using localizedStringFromDate")
  println(future12HoursAsString)
  println(future12HoursAsStringDay)
}

//test01()
test02()
