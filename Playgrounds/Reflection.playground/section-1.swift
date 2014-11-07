import UIKit
import Foundation

// swift file
// extend the NSObject class
extension NSObject {
    // create a static method to get a swift class for a string name
    class func swiftClassFromString(className: String) -> AnyClass! {
        // get the project name
        if  var appName: String? = NSBundle.mainBundle().objectForInfoDictionaryKey("CFBundleName") as String? {
            // generate the full name of your class (take a look into your "YourProject-swift.h" file)
            let classStringName = "_TtC\(appName!.utf16Count)\(appName)\(countElements(className))\(className)"
            // return the class!
            return NSClassFromString(classStringName)
        }
        return nil;
    }
}

var key: String = "UILabel"
