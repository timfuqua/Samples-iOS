/*
* Copyright (c) 2015 Razeware LLC
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
* AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
* LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
* OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
* THE SOFTWARE.
*/

import UIKit
import Bond

class ViewController: UIViewController {
  
  private let viewModel = MovieSearchViewModel()
    
  @IBOutlet weak var searchTextField: UITextField!
  @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
  @IBOutlet weak var resultsTable: UITableView!

  override func viewDidLoad() {
    super.viewDidLoad()
    
    bindViewModel()
  }
  
  func bindViewModel() {
    bindSearchString()
    bindValidSearchText()
    bindSearchResults()
    bindSearchInProgress()
    bindErrorMessages()
  }
  
  private func bindSearchString() {
    viewModel.searchString.bidirectionalBindTo(searchTextField.bnd_text)
  }
  
  private func bindValidSearchText() {
    viewModel.validSearchText
      .map { $0 ? UIColor.blackColor() : UIColor.redColor() }
      .bindTo(searchTextField.bnd_textColor)
  }
  
  private func bindSearchResults() {
    viewModel.searchResults.lift().bindTo(resultsTable) { indexPath, dataSource, tableView in
      let cell = tableView.dequeueReusableCellWithIdentifier("MovieCell", forIndexPath: indexPath)
      let movie = dataSource[indexPath.section][indexPath.row]
      cell.textLabel!.text = "\(movie.title) (\(movie.year)) - \(movie.type)"
      cell.detailTextLabel!.text = "IMDb ID: \(movie.imdbID)"
      
      return cell
    }
  }
  
  private func bindSearchInProgress() {
    viewModel.searchInProgress
      .map { !$0 }
      .bindTo(activityIndicator.bnd_hidden)
    
    viewModel.searchInProgress
      .map { $0 ? CGFloat(0.5) : CGFloat(1.0) }
      .bindTo(resultsTable.bnd_alpha)
  }
  
  private func bindErrorMessages() {
    viewModel.errorMessages.observe {
      [unowned self] error in
      
      let alertController = UIAlertController(title: "Something went wrong :[", message: error, preferredStyle: .Alert)
      self.presentViewController(alertController, animated: true, completion: nil)
      
      let actionOk = UIAlertAction(title: "OK", style: .Default, handler: {
        action in
        alertController.dismissViewControllerAnimated(true, completion: nil)
      })
      alertController.addAction(actionOk)
    }
  }

}

