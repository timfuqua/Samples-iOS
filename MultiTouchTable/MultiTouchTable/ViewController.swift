import UIKit

class ViewController: UITableViewController {

  var dataSource: [String] = [String]()
  @IBOutlet var simpleTableView: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    for index in 0...9 {
      dataSource.append("Item \(index)")
    }
    
    let recognizer = UITapGestureRecognizer(target: self, action: "didTap")
    recognizer.delegate = self
    recognizer.cancelsTouchesInView = false
    view.addGestureRecognizer(recognizer)
    
    simpleTableView.allowsMultipleSelection = true
  }
  
  func didTap() {
    println("Received tap")
  }

}

extension ViewController: UITableViewDataSource {
  
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return dataSource.count
  }

  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("simpleCell", forIndexPath: indexPath) as UITableViewCell
    
    cell.textLabel?.text = dataSource[indexPath.row]
    
    return cell
  }
  
}

extension ViewController: UITableViewDelegate {

  override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    println("Selected cell \(dataSource[indexPath.row])")
  }
  
  override func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
    println("Deselected cell \(dataSource[indexPath.row])")
  }
  
}

extension ViewController: UIGestureRecognizerDelegate {
  
  func gestureRecognizer(gestureRecognizer: UIGestureRecognizer, shouldReceiveTouch touch: UITouch) -> Bool {
    var location: CGPoint = touch.locationInView(self.view)

    println("Touch received at location \(location.x),\(location.y)")
    
    return true
  }
  
}
