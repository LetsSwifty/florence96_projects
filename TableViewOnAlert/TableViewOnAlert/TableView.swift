//
//  TableView.swift
//  TableViewOnAlert
//
//  Created by Yejin Hong on 2022/05/09.
//

import Foundation
import UIKit

class TableView: UITableViewController {
    var delegate: ViewController?
    
    override func viewDidLoad() {
            super.viewDidLoad()
            
            self.preferredContentSize.height = 220
        }
        
        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 15
            
        }
        
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = UITableViewCell()
            cell.textLabel!.text = "\(indexPath.row) 번째 옵션"
            cell.textLabel!.font = UIFont.systemFont(ofSize: 13)
            return cell
        }
}
