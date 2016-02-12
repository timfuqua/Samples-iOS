//
//  MovieSearchViewModel.swift
//  BindingWithBond
//
//  Created by Tim Fuqua on 2/10/16.
//  Copyright © 2016 Razeware. All rights reserved.
//

import Foundation
import Bond

class MovieSearchViewModel {
  
  private let searchService = MovieSearch()
  
  let searchString = Observable<String?>("")
  let validSearchText = Observable<Bool>(false)
  let searchResults = ObservableArray<Movie>()
  let searchInProgress = Observable<Bool>(false)
  let errorMessages = EventProducer<String>()
  
  init() {
    searchString.value = ""
    
    searchString
      .filter { $0!.length() > 1 }
      .throttle(0.5, queue: Queue.Main)
      .observe {
        [unowned self] text in
        self.executeSearch(text!)
    }
    
    searchString
      .map { $0!.length() > 1 }
      .bindTo(validSearchText)
  }
  
  func executeSearch(text: String) {
    var query = MovieQuery()
    query.text = searchString.value ?? ""
    query.text = query.text.stringByReplacingOccurrencesOfString(" ", withString: "+")
    
    if query.text.characters.last == Character("+") {
      query.text.removeAtIndex(query.text.endIndex.predecessor())
    }
    
    searchInProgress.value = true
    
    searchService.findMovies(query) {
      [unowned self] result in
      
      self.searchInProgress.value = false
      
      switch result {
      case .Success(let movies):
        print("OMDb API returned \(movies.count) movies")
        self.searchResults.removeAll()
        self.searchResults.insertContentsOf(movies, atIndex: 0)
      case .Error:
        print("Sad face :[")
        self.errorMessages.next("There was an API request issue of some sort.")
      }
    }
  }
  
}
