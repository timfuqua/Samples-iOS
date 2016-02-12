//
//  MovieSearchError.swift
//  BindingWithBond
//
//  Created by Tim Fuqua on 2/10/16.
//  Copyright © 2016 Razeware. All rights reserved.
//

import Foundation

// Describes the various errors that can occur when querying the OMDb API
enum MovieSearchError: ErrorType {
  case RequestError
  case ParseError
  case MalformedRequest
}
