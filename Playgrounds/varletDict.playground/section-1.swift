// Playground - noun: a place where people can play

import UIKit

let preLoginHeaders: [NSObject : AnyObject]? = [
  "Content-Type": "application/json",
  "APIVersion": "3",
]

var postLoginHeaders: [NSObject : AnyObject]? = preLoginHeaders

postLoginHeaders!.updateValue("somethingNew", forKey: "Authorization")
postLoginHeaders