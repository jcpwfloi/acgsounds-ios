//
//  SearchViewController.swift
//  ACGSounds
//
//  Created by David Chen on 28/05/2017.
//  Copyright © 2017 FropsVM Networks Limited. All rights reserved.
//

import UIKit
import Material

class SearchViewController: UIViewController {
    // View.
    internal var tableView: SearchSheetTableView!
    internal var searchText: String!
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Color.grey.lighten5
        
        // Prepare view.
        prepareSearchBar()
        prepareTableView()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        tableView?.reloadData()
    }
}

/// Model.
extension SearchViewController {
    internal func prepareTableView() {
        tableView = SearchSheetTableView()
        view.layout(tableView).edges()
    }
    
    internal func reloadData() {
    }
}

// View.
extension SearchViewController: SearchBarDelegate {
    internal func prepareSearchBar() {
        // Access the searchBar.
        guard let searchBar = searchBarController?.searchBar else {
            return
        }
        
        searchBar.delegate = self
    }
    
    func searchBar(searchBar: SearchBar, didClear textField: UITextField, with text: String?) {
        reloadData()
    }
    
    func reload() {
        searchSheetByKeyword(searchText) { sheets in
            self.tableView.data = sheets
        }
    }
    
    func searchBar(searchBar: SearchBar, didChange textField: UITextField, with text: String?) {
        searchText = text?.trimmed
        
        NSObject.cancelPreviousPerformRequests(withTarget: self, selector: #selector(self.reload), object: nil)
        self.perform(#selector(self.reload), with: nil, afterDelay: 1)
        
        /*guard let pattern = text?.trimmed, 0 < pattern.utf16.count else {
            reloadData()
            return
        }*/
    }
}
