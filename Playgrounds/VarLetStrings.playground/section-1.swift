// Playground - noun: a place where people can play

import UIKit

let defaultServerIP: String = "https://75.150.249.10"
var serverIP: String = defaultServerIP

var serverinfoURL: String { return serverIP + "/AAAPI/serverinfo" }

println(serverinfoURL)

serverIP = "Something"

println(serverinfoURL)

// Cannot assign to a get-only property 'serverinfoURL'
//serverinfoURL = "Something else"
