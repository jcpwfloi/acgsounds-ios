//
//  SheetDetailController.swift
//  ACGSounds
//
//  Created by David Chen on 27/05/2017.
//  Copyright © 2017 FropsVM Networks Limited. All rights reserved.
//

import UIKit
import Material

class SheetDetailController: UIViewController {
    internal var tableView: SheetDetailTableView!
    
    fileprivate var backButton: IconButton!
    fileprivate var searchButton: IconButton!
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Color.grey.lighten5
        
        prepareNavigationItem()
        
        tableView = SheetDetailTableView()
        view.layout(tableView).edges()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationItem.title = sheetDetail?.sheetName
        navigationItem.detail = sheetDetail?.author
        
        getCommentsBySheetIdAndPage(sheetDetail!._id, commentPage: 1) { comments in
            self.tableView.data = comments
        }
    }
}

extension SheetDetailController {
    fileprivate func prepareBackButton() {
        backButton = IconButton(image: Icon.cm.arrowBack)
        backButton.addTarget(self, action: #selector(handleBackButton), for: .touchUpInside)
    }
    
    fileprivate func prepareSearchButton() {
        searchButton = IconButton(image: Icon.cm.search)
        searchButton.addTarget(self, action: #selector(handleSearchButton), for: .touchUpInside)
    }
    
    fileprivate func prepareNavigationItem() {
        prepareBackButton()
        prepareSearchButton()
        
        navigationItem.leftViews = [backButton]
        navigationItem.rightViews = [searchButton]
    }
}

extension SheetDetailController {
    @objc
    fileprivate func handleBackButton() {
        let window = self.view.window!
        window.rootViewController = firstView
    }
    
    @objc
    fileprivate func handleSearchButton() {
        let window = view.window!
        window.rootViewController = searchView
    }
}
