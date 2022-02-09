//
//
// File: File.swift
// Project: 
//
// Created by Stephen Nutman on 09/02/2022
// Copyright © 2022 ACTYAR. All rights reserved.
//

	

import UIKit

public class LogViewController: UITableViewController {
    
    // MARK: - Properties
    let logItems = LogStore.log
    
    // MARK: - View Management
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    
    // MARK: - Table Delegates
    
    public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return logItems.count
    }
    
    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = logItems[indexPath.row]
        
        return cell
    }
    
}
