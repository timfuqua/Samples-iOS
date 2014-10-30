import UIKit
import XCPlayground

//  allow the asynchronous task to continue, set timeout in console
XCPSetExecutionShouldContinueIndefinitely()

let url = NSURL(string:"http://192.168.1.96:8080/Deliverable/mongoose.conf")
var session = NSURLSession.sharedSession()

//  use a separate handler function in lieu of doing it inline for clarity
func apiHandler(data:NSData!, response:NSURLResponse!, error:NSError!) {
    if (error != nil) {
        println("API error: \(error), \(error.userInfo)")
    }
    var jsonError:NSError?
    var json:NSDictionary = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: &jsonError) as NSDictionary
    if (jsonError != nil) {
        println("Error parsing json: \(jsonError)")
    }
    else {
        let status:String? = json["msg"] as? String
        println("server status: \(status)")
    }
}

var task:NSURLSessionDataTask = session.dataTaskWithURL(url!, completionHandler:apiHandler)

task.resume()
