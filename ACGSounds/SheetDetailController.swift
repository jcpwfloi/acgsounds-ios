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
    fileprivate var backButton: IconButton!
    fileprivate var starButton: IconButton!
    fileprivate var searchButton: IconButton!
    
    //fileprivate var fabButton: FABButton!
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Color.grey.lighten5
        
        prepareBackButton()
        prepareStarButton()
        prepareSearchButton()
        prepareNavigationItem()
        //prepareFABButton()
    }
}

extension SheetDetailController {
    fileprivate func prepareBackButton() {
        backButton = IconButton(image: Icon.cm.arrowBack)
        backButton.addTarget(self, action: #selector(handleBackButton), for: .touchUpInside)
    }
    
    fileprivate func prepareStarButton() {
        starButton = IconButton(image: Icon.cm.star)
    }
    
    fileprivate func prepareSearchButton() {
        searchButton = IconButton(image: Icon.cm.search)
    }
    
    fileprivate func prepareNavigationItem() {
        navigationItem.title = sheetDetail?.sheetName
        navigationItem.detail = sheetDetail?.author
        
        navigationItem.leftViews = [backButton]
        navigationItem.rightViews = [starButton, searchButton]
    }
    
    @objc
    fileprivate func handleBackButton() {
        let window = self.view.window!
        window.rootViewController = firstView
    }
    /*
    fileprivate func prepareFABButton() {
        fabButton = FABButton(image: Icon.cm.photoCamera)
        fabButton.addTarget(self, action: #selector(handleNextButton), for: .touchUpInside)
        view.layout(fabButton).width(64).height(64).bottom(24).right(24)
    }*/
}

extension SheetDetailController {
    @objc
    fileprivate func handleNextButton() {
    }
}
