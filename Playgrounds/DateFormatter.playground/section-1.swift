// Playground - noun: a place where people can play

import UIKit

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

private func test3() {
  let inputDateString1: String = "2015-05-04 15:06:16"
  let inputDateString2: String = "2015-05-05 15:06:16"
  let inputDateString3: String = "2015-05-06 15:06:16"
  let inputDateString4: String = "2015-05-04 15:06:16"
  
  let inputDateFormatter = NSDateFormatter()
  inputDateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
  
  var inputDate1 = inputDateFormatter.dateFromString(inputDateString1)
  var inputDate2 = inputDateFormatter.dateFromString(inputDateString2)
  var inputDate3 = inputDateFormatter.dateFromString(inputDateString3)
  var inputDate4 = inputDateFormatter.dateFromString(inputDateString4)
  
  // test: Less than (true)
  println("Should be true: \(inputDate1! < inputDate2!)")
  println("Should be true: \(inputDate1! < inputDate3!)")
  println("Should be true: \(inputDate2! < inputDate3!)")

  // test: Less than (false)
  println("Should be false: \(inputDate2! < inputDate1!)")
  println("Should be false: \(inputDate3! < inputDate1!)")
  println("Should be false: \(inputDate3! < inputDate2!)")

  // test: Less than (true)
  println("Should be false: \(inputDate1! > inputDate2!)")
  println("Should be false: \(inputDate1! > inputDate3!)")
  println("Should be false: \(inputDate2! > inputDate3!)")
  
  // test: Less than (false)
  println("Should be true: \(inputDate2! > inputDate1!)")
  println("Should be true: \(inputDate3! > inputDate1!)")
  println("Should be true: \(inputDate3! > inputDate2!)")

  // test: Equality (true)
  println("Should be equal: \(inputDate1! == inputDate4!)")
  println("Should not be equal: \(inputDate1! == inputDate3!)")
}

private func test4() {
  let inputDateString1: String = "2015-05-04 15:06:16"
  let inputDateString2: String = "2015-05-05 15:06:16"
  let inputDateString3: String = "2015-05-06 15:06:16"
  let inputDateString4: String = "2015-05-04 15:06:16"
  
  let inputDateFormatter = NSDateFormatter()
  inputDateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
  
  var inputDate1 = inputDateFormatter.dateFromString(inputDateString1)
  var inputDate2 = inputDateFormatter.dateFromString(inputDateString2)
  var inputDate3 = inputDateFormatter.dateFromString(inputDateString3)
  var inputDate4 = inputDateFormatter.dateFromString(inputDateString4)
  
  // test: Less than (true)
  println("Should be true: \(inputDate1!.isLessThan(inputDate2!))")
  println("Should be true: \(inputDate1!.isLessThan(inputDate3!))")
  println("Should be true: \(inputDate2!.isLessThan(inputDate3!))")
  
  // test: Less than (false)
  println("Should be false: \(inputDate2!.isLessThan(inputDate1!))")
  println("Should be false: \(inputDate3!.isLessThan(inputDate1!))")
  println("Should be false: \(inputDate3!.isLessThan(inputDate2!))")
  
  // test: Less than (true)
  println("Should be false: \(inputDate1!.isGreaterThan(inputDate2!))")
  println("Should be false: \(inputDate1!.isGreaterThan(inputDate3!))")
  println("Should be false: \(inputDate2!.isGreaterThan(inputDate3!))")
  
  // test: Less than (false)
  println("Should be true: \(inputDate2!.isGreaterThan(inputDate1!))")
  println("Should be true: \(inputDate3!.isGreaterThan(inputDate1!))")
  println("Should be true: \(inputDate3!.isGreaterThan(inputDate2!))")
  
  // test: Equality (true)
  println("Should be equal: \(inputDate1!.isEqualTo(inputDate4!))")
  println("Should not be equal: \(inputDate1!.isEqualTo(inputDate3!))")
}

//test1()
//test2()
//test3()
test4()
