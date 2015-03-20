//
//  ViewController.swift
//  AlamofireSample
//
//  Created by Tim Fuqua on 3/19/15.
//  Copyright (c) 2015 FuquaProductions. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    
//    GET()
//    GETAsString()
//    GETAsJSON()
//    GETChaining()
//    GETWithNSURLCredential()
//    POST()
//    POSTParametersAsJSON()
//    PUT()
    
//    iC2WPOSTWithCredentials()
    Manager.sharedInstance.session.configuration.HTTPAdditionalHeaders = [
      "Content-Type": "application/json",
      "APIVersion": "3",
    ]
    iC2WGETAsJSON()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  private func GET() {
    println("\n\n GET \n")
    Alamofire.request(.GET, "http://httpbin.org/get")
      .response { (request, response, data, error) in
        println(request)
        println(response)
        println(error)
    }
  }
  
  private func GETAsString() {
    println("\n\n GETAsString \n")
    Alamofire.request(.GET, "http://httpbin.org/get")
      .responseString { (request, response, string, error) in
        println(string!)
    }
  }
  
  private func GETAsJSON() {
    println("\n\n GETAsJSON \n")
    Alamofire.request(.GET, "http://httpbin.org/get")
      .responseJSON {(request, response, JSON, error) in
        println(JSON!)
    }
  }
  
  private func GETChaining() {
    println("\n\n GETChaining \n")
    let user: String = "user"
    let password: String = "password"
    Alamofire.request(.GET, "http://httpbin.org/get")
      .authenticate(user: user, password: password)
      .progress { (bytesRead, totalBytesRead, totalBytesExpectedToRead) in
        println(totalBytesRead)
      }
      .responseJSON { (request, response, JSON, error) in
        println(JSON!)
      }
      .responseString { (request, response, string, error) in
        println(string!)
    }
  }
  
  private func GETWithNSURLCredential() {
    println("\n\n GETWithNSURLCredential \n")
    let user = "user"
    let password = "password"
    let credential = NSURLCredential(user: user, password: password, persistence: .ForSession)
    Alamofire.request(.GET, "https://httpbin.org/basic-auth/\(user)/\(password)")
      .authenticate(usingCredential: credential)
      .response {(request, response, _, error) in
        println(response!)
    }
  }
  
  private func POST() {
    println("\n\n POST \n")
    Alamofire.request(.POST, "http://httpbin.org/post")
      .responseString { (request, response, string, error) in
        println(string!)
    }
  }
  
  private func POSTParametersAsJSON() {
    println("\n\n POSTParametersAsJSON \n")
    let parameters: [String : AnyObject]? = [
      "foo": "bar",
      "baz": ["a", 1],
      "qux": [
        "x": 1,
        "y": 2,
        "z": 3
      ]
    ]
    
    Alamofire.request(.POST, "http://httpbin.org/post", parameters: parameters, encoding: .JSON)
      .responseJSON {(request, response, JSON, error) in
        println(JSON!)
    }
  }
  
  private func PUT() {
    println("\n\n PUT \n")
    Alamofire.request(.PUT, "http://httpbin.org/put")
      .response { (request, response, data, error) in
        println(request)
        println(response)
        println(error)
    }
  }
  
  private func iC2WPOSTWithCredentials() {
    println("\n\n iC2WPOSTWithCredentials \n")
    
    Manager.sharedInstance.session.configuration.HTTPAdditionalHeaders = [
      "Content-Type": "application/json",
      "APIVersion": "3",
    ]
    
    let parameters: [String : AnyObject]? = [
      "session": [
        "username": "lookitup",
        "password": "lookitup",
        "domain": "lookitup"
      ]
    ]
    
    Alamofire.request(.POST, "https://75.150.249.10/AAAPI/session", parameters: parameters, encoding: .JSON)
      .responseJSON { (request, response, JSON, error) in
        println(JSON!)
    }
  }
  
  private func iC2WGETAsJSON() {
    println("\n\n iC2WGETAsJSON \n")
    
    Alamofire.request(.GET, "https://75.150.249.10/AAAPI/serverinfo")
      .responseJSON {(request, response, JSON, error) in
        println(JSON!)
    }
  }

}

