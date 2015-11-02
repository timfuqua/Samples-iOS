/*: 
# DelegateManager
Sometimes, a module will want to communicate to another module through
    a custom protocol. The means of communication is sometimes accomplished
    through a delegate.

This is commonly seen when a view controller presents another view controller
    modally, as with a popover. The popover will define a protocol with
    functions that represent the interactions with the popover that the parent
    view controller would like to know about, such as when a "selection" has
    been made, if an item was "deleted", or if a particular gesture was
    detected.

The parent view controller will conform to the protocol, and when it creates
    the popover, it sets itself as the popover's delegate.

The issue here is that the popover implements it's delegate property as a
    single variable. If there were some other module that wanted to know
    when something happened in the popover, the popover would need to add
    a second delegate variable of a different name, and invoke the delegate's
    functions for the second delegate each time as well. You can quickly see
    how this breaks down as you add a third or fourth delegate that the popover
    needs to keep track of.

The *DelegateManager* class takes care of the complexity of managing multiple
    delegates for you. Instead of the popover having a single delegate, it owns
    a *DelegateManager* instantiated with it's type of delegate. The parent view
    controller can subscribe to the popover's delegate manager instance, and any
    other modules can as well. The subscribing module should make sure to
    unsubscribe from the popover's delegate manager if the subscribing module
    is being destroyed, to avoid dangling references.

For this example, instead of using actual UIViewController classes, I will just
    use regular classes and simulate the appearing and disappearing through
    init and deinit.
*/

import Foundation

/*:
## Old Way
*/

protocol OldWayPopoverDelegate {
  func selectionHappened()
  func deletionHappened()
  func gestureHappened()
}

class OldWayPopover {
  
  var delegate: OldWayPopoverDelegate? = nil
  var otherDelegate: OldWayPopoverDelegate? = nil
  
  init() {
    println("OldWayPopover init")
  }
  
  deinit {
    println("OldWayPopover deinit")
  }
  
  func showPopover() {
    println("OldWayPopover is now being presented")
  }
  
  func closePopover() {
    println("OldWayPopover is going to close")
  }
  
  func simulateSelection() {
    println("OldWayPopover is going to simulate a selection and notify the delegates")
    delegate?.selectionHappened()
    otherDelegate?.selectionHappened()
  }
  
  func simulateDeletion() {
    println("OldWayPopover is going to simulate a deletion and notify the delegates")
    delegate?.deletionHappened()
    otherDelegate?.deletionHappened()
  }
  
  func simulateGesture() {
    println("OldWayPopover is going to simulate a gesture and notify the delegates")
    delegate?.gestureHappened()
    otherDelegate?.gestureHappened()
  }
  
}

class OldWayParent {
  
  var popover: OldWayPopover? = nil
  
  init() {
    println("OldWayParent init")
  }
  
  deinit {
    println("OldWayParent deinit")
  }
  
  func simulateCreatePopover() {
    println("OldWayParent will create and show the OldWayPopover")
    popover = OldWayPopover()
    popover?.showPopover()
    popover?.delegate = self
  }
  
  func simulateDismissPopover() {
    println("OldWayParent will create and show the OldWayPopover")
    popover?.closePopover()
    popover = nil
  }
  
  func doSimulationsInPopover() {
    println("Performing simulations in OldWayPopover. OldWayParent delegate functions will be called, as well as otherDelegate, if it exists.")
    popover?.simulateSelection()
    popover?.simulateDeletion()
    popover?.simulateGesture()
  }
  
}

extension OldWayParent: OldWayPopoverDelegate {
  
  func selectionHappened() {
    println("OldWayParent::selectionHappened()")
  }
  
  func deletionHappened() {
    println("OldWayParent::deletionHappened()")
  }
  
  func gestureHappened() {
    println("OldWayParent::gestureHappened()")
  }
  
}

class OldWayOtherModule {
  
  init() {
    println("OldWayOtherModule init")
  }
  
  deinit {
    println("OldWayOtherModule deinit")
  }
  
}

extension OldWayOtherModule: OldWayPopoverDelegate {
  
  func selectionHappened() {
    println("OldWayOtherModule::selectionHappened()")
  }
  
  func deletionHappened() {
    println("OldWayOtherModule::deletionHappened()")
  }
  
  func gestureHappened() {
    println("OldWayOtherModule::gestureHappened()")
  }
  
}


func testOldWayJustParent() {
  var parent: OldWayParent? = OldWayParent()
  parent?.simulateCreatePopover()
  parent?.doSimulationsInPopover()
  parent?.simulateDismissPopover()
  parent = nil
}

func testOldWayParentAndOtherModule() {
  var parent: OldWayParent? = OldWayParent()
  var otherModule: OldWayOtherModule? = OldWayOtherModule()
  parent?.simulateCreatePopover()
  parent?.popover?.otherDelegate = otherModule
  parent?.doSimulationsInPopover()
  parent?.simulateDismissPopover()
  otherModule = nil
  parent = nil
}

/*:
Uncomment the function for the test you want to see and be sure to Show
    Assistant Editor (View->Assistant Editor->Show Assistant Editor) to see the
    console output.
*/
//testOldWayJustParent()
//testOldWayParentAndOtherModule()


/*:
## New Way
*/

//func findIdenticalObject<T : AnyObject>(array: [T], value: T) -> Int? {
//  for i in 0..<array.count {
//    if array[i] === value {
//      return i
//    }
//  }
//  return nil
//}
func findIdenticalObject<T : AnyObject>(array: [T], value: T) -> Int? {
  for (index, elem) in enumerate(array) {
    if elem === value {
      return index
    }
  }
  return nil
}

class DelegateManager<T where T: AnyObject> {
  
  private(set) var delegateName: String = ""
  private(set) var delegates: [T] = []
  
  init(delegateName: String) {
    println("Creating a DelegateManager with name \(delegateName)")
    self.delegateName = delegateName
  }
  
  deinit {
    println("Destroying the DelegateManager with name \(delegateName)")
    removeAllDelegates()
  }
  
  func isInDelegatesList(delegate: T) -> Bool {
    return findIdenticalObject(delegates, delegate) != nil
  }
  
  func subscribe(delegate: T) {
    if let index = findIdenticalObject(delegates, delegate) {
      println("\(delegateName) delegate already added to this DelegateManager. Ignoring.")
    }
    else {
      println("Adding a \(delegateName) delegate to DelegateManager.")
      delegates.append(delegate)
    }
  }
  
  func unsubscribe(delegate: T) {
    if let index = findIdenticalObject(delegates, delegate) {
      println("Removing \(delegateName) delegate from DelegateManager.")
      delegates.removeAtIndex(index)
    }
  }
  
  func removeAllDelegates() {
    delegates.removeAll()
  }
  
}


@objc protocol NewWayPopoverDelegate: class {
  func selectionHappened()
  func deletionHappened()
  func gestureHappened()
}

class NewWayPopover {
  
  var newWayPopoverDelegates: DelegateManager<NewWayPopoverDelegate>
  
  init() {
    println("NewWayPopover init")
    newWayPopoverDelegates = DelegateManager<NewWayPopoverDelegate>(delegateName: "NewWayPopoverDelegate")
  }
  
  deinit {
    println("NewWayPopover deinit")
  }
  
  func showPopover() {
    println("NewWayPopover is now being presented")
  }
  
  func closePopover() {
    println("NewWayPopover is going to close")
  }
  
  func simulateSelection() {
    println("NewWayPopover is going to simulate a selection and notify ALL the delegates")
    notifyThatSelectionHappened()
  }
  
  func simulateDeletion() {
    println("NewWayPopover is going to simulate a deletion and notify ALL the delegates")
    notifyThatDeletionHappened()
  }
  
  func simulateGesture() {
    println("NewWayPopover is going to simulate a gesture and notify ALL the delegates")
    notifyThatGestureHappened()
  }
  
  private func notifyThatSelectionHappened() {
    println("Notifying ALL(\(newWayPopoverDelegates.delegates.count)) delegates that a selection happened")
    for delegate in newWayPopoverDelegates.delegates {
      delegate.selectionHappened()
    }
  }
  
  private func notifyThatDeletionHappened() {
    println("Notifying ALL(\(newWayPopoverDelegates.delegates.count)) delegates that a deletion happened")
    for delegate in newWayPopoverDelegates.delegates {
      delegate.deletionHappened()
    }
  }
  
  private func notifyThatGestureHappened() {
    println("Notifying ALL(\(newWayPopoverDelegates.delegates.count)) delegates that a gesture happened")
    for delegate in newWayPopoverDelegates.delegates {
      delegate.gestureHappened()
    }
  }
  
}

class NewWayParent {
  
  var popover: NewWayPopover? = nil
  
  init() {
    println("NewWayParent init")
  }
  
  deinit {
    println("NewWayParent deinit")
  }
  
  func simulateCreatePopover() {
    println("NewWayParent will create and show the NewWayPopover")
    popover = NewWayPopover()
    popover?.newWayPopoverDelegates.subscribe(self)
    popover?.showPopover()
  }
  
  func simulateDismissPopover() {
    println("NewWayParent will create and show the NewWayPopover")
    popover?.closePopover()
    popover = nil
  }
  
  func doSimulationsInPopover() {
    println("Performing simulations in NewWayPopover. NewWayParent delegate functions will be called, as well as otherDelegate, if it exists.")
    popover?.simulateSelection()
    popover?.simulateDeletion()
    popover?.simulateGesture()
  }
  
}

extension NewWayParent: NewWayPopoverDelegate {
  
  @objc func selectionHappened() {
    println("NewWayParent::selectionHappened()")
  }
  
  @objc func deletionHappened() {
    println("NewWayParent::deletionHappened()")
  }
  
  @objc func gestureHappened() {
    println("NewWayParent::gestureHappened()")
  }
  
}

class NewWayOtherModule {
  
  var moduleName: String = ""
  
  init(moduleName: String) {
    println("NewWayOtherModule init. Module named \(moduleName)")
    self.moduleName = moduleName
  }
  
  deinit {
    println("NewWayOtherModule deinit. Module named \(moduleName)")
  }
  
}

extension NewWayOtherModule: NewWayPopoverDelegate {
  
  @objc func selectionHappened() {
    println("NewWayOtherModule named \(moduleName)::selectionHappened()")
  }
  
  @objc func deletionHappened() {
    println("NewWayOtherModule named \(moduleName)::deletionHappened()")
  }
  
  @objc func gestureHappened() {
    println("NewWayOtherModule named \(moduleName)::gestureHappened()")
  }
  
}


func testNewWayJustParent() {
  var parent: NewWayParent? = NewWayParent()
  
  parent?.simulateCreatePopover()
  parent?.doSimulationsInPopover()
  parent?.simulateDismissPopover()
  
  parent = nil
}

func testNewWayParentAndOtherModule() {
  var parent: NewWayParent? = NewWayParent()
  var otherModule: NewWayOtherModule? = NewWayOtherModule(moduleName: "otherModule")
  
  parent?.simulateCreatePopover()
  parent?.popover?.newWayPopoverDelegates.subscribe(otherModule!)
  
  parent?.doSimulationsInPopover()
  
  parent?.simulateDismissPopover()
  parent?.popover?.newWayPopoverDelegates.unsubscribe(otherModule!)
  
  otherModule = nil
  parent = nil
}

func testNewWayParentAndManyOtherModules() {
  var parent: NewWayParent? = NewWayParent()
  var otherModule1: NewWayOtherModule? = NewWayOtherModule(moduleName: "otherModule1")
  var otherModule2: NewWayOtherModule? = NewWayOtherModule(moduleName: "otherModule2")
  var otherModule3: NewWayOtherModule? = NewWayOtherModule(moduleName: "otherModule3")
  var otherModule4: NewWayOtherModule? = NewWayOtherModule(moduleName: "otherModule4")
  
  parent?.simulateCreatePopover()
  parent?.popover?.newWayPopoverDelegates.subscribe(otherModule1!)
  parent?.popover?.newWayPopoverDelegates.subscribe(otherModule2!)
  parent?.popover?.newWayPopoverDelegates.subscribe(otherModule3!)
  parent?.popover?.newWayPopoverDelegates.subscribe(otherModule4!)
  
  parent?.doSimulationsInPopover()
  
  parent?.simulateDismissPopover()
  parent?.popover?.newWayPopoverDelegates.unsubscribe(otherModule1!)
  parent?.popover?.newWayPopoverDelegates.unsubscribe(otherModule2!)
  parent?.popover?.newWayPopoverDelegates.unsubscribe(otherModule3!)
  parent?.popover?.newWayPopoverDelegates.unsubscribe(otherModule4!)
  
  otherModule1 = nil
  otherModule2 = nil
  otherModule3 = nil
  otherModule4 = nil
  parent = nil
}

/*:
Uncomment the function for the test you want to see and be sure to Show
    Assistant Editor (View->Assistant Editor->Show Assistant Editor) to see the
    console output.
*/

//testNewWayJustParent()
//testNewWayParentAndOtherModule()
//testNewWayParentAndManyOtherModules()

