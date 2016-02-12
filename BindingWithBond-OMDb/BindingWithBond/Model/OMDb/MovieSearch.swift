//
//  MovieSearch.swift
//  BindingWithBond
//
//  Created by Tim Fuqua on 2/10/16.
//  Copyright © 2016 Razeware. All rights reserved.
//

import Foundation

// Provides an interface for querying the OMDb API
class MovieSearch {
  
  let host = "https://www.omdbapi.com/"
  
  init() {
    
  }
  
  func findMovies(query: MovieQuery, callback: Result<MovieArray> -> ()) {
    // construct the query URL
    guard let url = NSURL(string: "\(host)?s=\(query.text)") else {
      print("findMovies: MovieSearchError.MalformedRequest")
      callback(.Error(MovieSearchError.MalformedRequest))
      return
    }
    
    // perform the request
    let task = NSURLSession.sharedSession().dataTaskWithURL(url) {
      (data, response, error) in
      
      // dispatch onto the main thread
      dispatch_async(dispatch_get_main_queue()) {
        if data == nil || error != nil {
          callback(Result.Error(MovieSearchError.RequestError))
          print("findMovies: MovieSearchError.RequestError")
          return
        }
        
        do {
          // parse the results
          let result = try self.parseSearchResults(data!)
          callback(Result.Success(result))
        } catch {
          callback(Result.Error(MovieSearchError.ParseError))
          print("findMovies: MovieSearchError.ParseError")
        }
      }
    }
    
    task.resume()
  }
  
  // parses the JSON data returned by the OMDb API
  private func parseSearchResults(data: NSData) throws -> MovieArray {
    
    // convert the JSON response into a dictionary
    guard
      let jsonDict = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers) as? NSDictionary,
      let response = jsonDict["Response"] as? String else {
        print("parseSearchResults: MovieSearchError.ParseError")
        throw MovieSearchError.ParseError
    }
    
    if response.lowercaseString != "true" {
      return []
    }
    
    guard
      let movies = jsonDict["Search"] as? [NSDictionary] else {
        print("parseSearchResults: MovieSearchError.ParseError")
        throw MovieSearchError.ParseError
    }
    
    let parsedMovies = movies.map {
      movieDict -> Movie? in
      // parse each movie instance - if an error occurs, return nil
      guard let title = movieDict["Title"] as? String,
        let year = movieDict["Year"] as? String,
        let imdbID = movieDict["imdbID"] as? String,
        let type = movieDict["Type"] as? String else {
          return nil
      }
      
      return Movie(title: title, year: year, imdbID: imdbID, type: type)
      }
      // flatMap to unwrap optionals and remove nils
      .flatMap { return $0! }
    
    return parsedMovies
  }
  
}
