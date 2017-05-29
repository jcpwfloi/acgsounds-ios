//
//  SheetsViewController.swift
//  ACGSounds
//
//  Created by David Chen on 26/05/2017.
//  Copyright © 2017 FropsVM Networks Limited. All rights reserved.
//

import UIKit
import Material

class SheetsViewController: UIViewController {
    /// View.
    internal var tableView: CardTableView!
    internal var refreshControl: UIRefreshControl!
    internal var page = 1
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Color.blueGrey.lighten5
        
        // Feed.
        //prepareActivityIndicator()
        prepareTableView()
        prepareRefreshControl()
        
        tableView.addInfiniteScroll { (tableView) -> Void in
            self.page = self.page + 1
            
            getSheetByPage(self.page) { sheets in
                var answer = self.tableView.data
                
                for sheet in sheets {
                    answer.append(sheet)
                }
                
                self.tableView.data = answer
                tableView.finishInfiniteScroll()
            }
        }
    }
    
    open override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        refreshControl.beginRefreshing()
        reloadData()
    }
    
    open override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        refreshControl.beginRefreshing()
        reloadData()
    }
}

/// TableView.
extension SheetsViewController {
    internal func prepareTableView() {
        tableView = CardTableView()
        view.layout(tableView).edges()
    }
    
    internal func prepareRefreshControl() {
        refreshControl = UIRefreshControl()
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.addTarget(self, action: #selector(reloadData), for: UIControlEvents.valueChanged)
        tableView.addSubview(refreshControl) // not required when using UITableViewController
    }
    
    internal func reloadData() {
        page = 1
        
        getSheetByPage(1) { sheets in
            self.tableView.data = sheets
            self.refreshControl.endRefreshing()
        }
    }
}
