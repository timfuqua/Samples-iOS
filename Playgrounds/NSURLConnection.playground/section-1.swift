import UIKit
import XCPlayground

//  allow the asynchronous task to continue, set timeout in console
XCPSetExecutionShouldContinueIndefinitely()

let url = NSURL(string:"http://192.168.1.96:8080/Deliverable/mongoose.conf")
let urlReq = NSURLRequest(URL: url!)
let queue = NSOperationQueue()

NSURLConnection.sendAsynchronousRequest(urlReq, queue: queue, completionHandler: { (response: NSURLResponse!, data: NSData!, error: NSError!) -> Void in
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
})