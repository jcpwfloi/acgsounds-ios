//
//  SheetDetailTableView.swift
//  ACGSounds
//
//  Created by David Chen on 30/05/2017.
//  Copyright © 2017 FropsVM Networks Limited. All rights reserved.
//

import UIKit
import Material

class SheetDetailTableView: UITableView {
    internal lazy var heights = [IndexPath: CGFloat]()
    
    public var data = [Comment]() {
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
    open func prepare() {
        delegate = self
        dataSource = self
        separatorStyle = .none
        backgroundColor = nil
        
        register(SheetDetailCell.self, forCellReuseIdentifier: "SheetDetailCell")
        register(CommentCell.self, forCellReuseIdentifier: "CommentCell")
    }
}

extension SheetDetailTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return data.count
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return nil
        } else {
            return "Comments"
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    /// Prepares the cells within the tableView.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SheetDetailCell", for: indexPath) as! SheetDetailCell
            cell.data = sheetDetail
            cell.isLast = true
            heights[indexPath] = cell.height
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CommentCell", for: indexPath) as! CommentCell
            cell.numberIndicated = indexPath.row + 1
            cell.data = data[indexPath.row]
            cell.isLast = indexPath.row == data.count - 1
            heights[indexPath] = cell.height
            return cell
        }
    }
}

extension SheetDetailTableView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return heights[indexPath] ?? height
    }
}
