//
//  SecondViewController.swift
//  ACGSounds
//
//  Created by David Chen on 06/05/2017.
//  Copyright © 2017 FropsVM Networks Limited. All rights reserved.
//

import UIKit

class SecondViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let searchBar = UISearchBar()
        
        searchBar.placeholder = "Search"
        
        self.tableView.tableHeaderView = searchBar
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

