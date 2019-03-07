//
//  CountryMutualBorderTableViewController.swift
//  Countries
//
//  Created by Valerii Petin on 3/6/19.
//  Copyright © 2019 Valerii Petin. All rights reserved.
//

import UIKit

class CountryMutualBorderTableViewController: UITableViewController {
    
    var detailText: [String?] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Mutual Border"
    }
    
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return detailText.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MutualBorder", for: indexPath)
        
            cell.textLabel?.text = detailText[indexPath.row]
        
        return cell
    }
}
