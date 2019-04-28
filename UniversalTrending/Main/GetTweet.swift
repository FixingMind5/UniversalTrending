

import UIKit

class GetTweet: UITableViewController{
    
    let cellid = "Cellid"
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        tableView.register(TableViewCell.self, forCellReuseIdentifier: cellid)
        tableView.separatorStyle = .none
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellid, for: indexPath) as! TableViewCell
        //cell.textLabel?.text = "Something"
        //cell.textLabel?.numberOfLines = 0
        
        return cell
    }
}
