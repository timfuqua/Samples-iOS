import UIKit

class ViewController: UITableViewController {

  var dataSource: [String] = [String]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    for index in 0...9 {
      dataSource.append("Item \(index)")
    }
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
