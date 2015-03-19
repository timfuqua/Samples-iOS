import UIKit
import Foundation

//Extend Array to include 2 additional functions.
extension Array {
  
  func each(f: (T) -> ()) {
    for i in self {
      f(i)
    }
  }
  
  func remove(f: (T) -> Bool) -> [T] {
    var array = [T]()
    for x in self {
      let t = x as T
      if f(t) == false {
        array.append(t)
      }
    }
    return array
  }
  
}

func ==(lhs: Employee, rhs: Employee) -> Bool {
  return lhs.lastName == rhs.lastName &&
    lhs.firstName == rhs.firstName &&
    lhs.employeeID == rhs.employeeID
}

func isEqualToID(employee: Employee, searchID: String) -> Bool {
  return employee.employeeID == searchID
}

func <(lhs: Employee, rhs: Employee) -> Bool {
  if lhs.lastName < rhs.lastName {
    return true
  }
  else if lhs.lastName > rhs.lastName {
    return false
  }
  else {
    return lhs.firstName <= rhs.firstName
  }
}

class Employee: NSObject, Equatable, Comparable {
  
  var employeeID: String! = "0000000000"
  var firstName: String! = "FIRST"
  var lastName: String! = "LAST"
  
  override init() {
  }
  
  init(id: String, firstName: String, lastName: String) {
    self.employeeID = id
    self.firstName = firstName
    self.lastName = lastName
  }
  
  private func getDisplayedNameEmployeeIDFirstLast() -> String {
    return employeeID + " - " + firstName + " " + lastName
  }
  
  private func getDisplayedNameFirstLast() -> String {
    return firstName + " " + lastName
  }
  
  private func getDisplayedNameLastFirst() -> String {
    return lastName + ", " + firstName
  }
  
}

let employee01 = Employee(id: "a01", firstName: "Richard", lastName: "Sherman")
let employee02 = Employee(id: "b01", firstName: "Earl", lastName: "Thomas")
let employee03 = Employee(id: "b02", firstName: "Kam", lastName: "Chancellor")

var team = [employee01, employee02, employee03]

let searchByID = team.filter({ emp in
  emp.employeeID == "a01"
})

println(searchByID.count)
for emp in searchByID {
  println(emp.getDisplayedNameFirstLast())
}

