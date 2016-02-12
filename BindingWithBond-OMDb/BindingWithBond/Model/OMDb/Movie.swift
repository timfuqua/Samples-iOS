//
//  Movie.swift
//  BindingWithBond
//
//  Created by Tim Fuqua on 2/10/16.
//  Copyright © 2016 Razeware. All rights reserved.
//

import Foundation

typealias MovieArray = [Movie]

// Represents a single movie as returned by the OMDb API
struct Movie {
  let title: String
  let year: String
  let imdbID: String
  let type: String
//  let posterURL: NSURL
}
