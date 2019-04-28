

import UIKit

class GetTweet: UITableViewController{
    
    let cellid = "Cellid"
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        tableView.register(TableViewCell.self, forCellReuseIdentifier: cellid)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellid, for: indexPath)
        cell.textLabel?.text = "Something"
        cell.textLabel?.numberOfLines = 0
        return cell
    }
}
