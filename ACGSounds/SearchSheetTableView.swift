//
//  SearchSheetTableView.swift
//  ACGSounds
//
//  Created by David Chen on 28/05/2017.
//  Copyright © 2017 FropsVM Networks Limited. All rights reserved.
//

import UIKit
import Material

class SearchSheetTableView: UITableView {
    public var data = [Sheet]() {
        didSet {
            reloadData()
        }
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        prepare()
    }
    
    public init() {
        super.init(frame: .zero, style: .plain)
        prepare()
    }
    
    /// Prepares the tableView.
    private func prepare() {
        register(TableViewCell.self, forCellReuseIdentifier: "SearchSheetTableViewCell")
        dataSource = self
        delegate = self
        separatorStyle = .none
    }
}

/// UITableViewDataSource.
extension SearchSheetTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    /// Prepares the cells within the tableView.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchSheetTableViewCell", for: indexPath) as! TableViewCell
        
        let sheet = data[indexPath.row]
        
        cell.textLabel?.text = sheet.sheetName
        //cell.imageView?.image = user["photo"] as? UIImage
        cell.detailTextLabel?.text = sheet.author
        cell.dividerColor = Color.grey.lighten3
        
        return cell
    }
}

/// UITableViewDelegate.
extension SearchSheetTableView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.divider.reload()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sheet = data[indexPath.row]
        
        sheetDetail = sheet
        
        window?.rootViewController = secondView
    }
}
