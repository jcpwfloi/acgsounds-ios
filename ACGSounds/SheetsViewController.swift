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
    internal var indicator = UIActivityIndicatorView()
    
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
        prepareActivityIndicator()
        prepareTableView()
    }
    
    open override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        reloadData()
    }
    
    open override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        reloadData()
    }
}

/// TableView.
extension SheetsViewController {
    internal func prepareTableView() {
        tableView = CardTableView()
        view.layout(tableView).edges()
    }
    
    internal func prepareActivityIndicator() {
        self.indicator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        self.indicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
        self.indicator.center = self.view.center
        self.view.addSubview(indicator)
    }
    
    internal func reloadData() {
        // assign value to self.tableView.data
        
        indicator.startAnimating()
        indicator.backgroundColor = UIColor.white
        
        getSheetByPage(1) { sheets in
            self.tableView.data = sheets
            self.indicator.stopAnimating()
            self.indicator.hidesWhenStopped = true
        }
    }
}
