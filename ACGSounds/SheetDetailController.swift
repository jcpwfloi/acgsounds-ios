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
    
    fileprivate var detailCard: Card!
    fileprivate var cardToolbar: Toolbar!
    fileprivate var cardMoreButton: IconButton!
    
    fileprivate var sheetIntro: UILabel!
    
    //fileprivate var fabButton: FABButton!
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Color.grey.lighten5
        
        prepareBackButton()
        prepareStarButton()
        prepareSearchButton()
        prepareNavigationItem()
        prepareCard()
        
        flush()
    }
    
    open override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        flush()
    }
}

extension SheetDetailController {
    fileprivate func flush() {
        navigationItem.title = sheetDetail?.sheetName
        navigationItem.detail = sheetDetail?.author
        
        cardToolbar.title = sheetDetail?.sheetName
        cardToolbar.detail = sheetDetail?.author
        
        sheetIntro.text = "Loading Sheet Introduction...."
        
        getSheetById(sheetDetail!._id) { detailedSheet in
            self.sheetIntro.text = detailedSheet.description
            self.detailCard.setNeedsLayout()
            self.detailCard.layoutIfNeeded()
            self.detailCard.x = 0
            self.detailCard.y = 0
        }
    }
    
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
        navigationItem.leftViews = [backButton]
        navigationItem.rightViews = [starButton, searchButton]
    }
}

//prepare Cards

extension SheetDetailController {
    fileprivate func prepareCardMoreButton() {
        cardMoreButton = IconButton(image: Icon.cm.moreVertical, tintColor: Color.grey.base)
    }
    
    fileprivate func prepareCardToolbar() {
        prepareCardMoreButton()
        
        cardToolbar = Toolbar(rightViews: [cardMoreButton])
        
        cardToolbar.titleLabel.textAlignment = .left
        cardToolbar.detailLabel.textAlignment = .left
        cardToolbar.detailLabel.textColor = Color.grey.base
    }
    
    fileprivate func prepareSheetIntro() {
        sheetIntro = UILabel()
        sheetIntro.numberOfLines = 0
        sheetIntro.text = "Loading Sheet Introduction...."
        sheetIntro.font = RobotoFont.regular(with: 14)
    }
    
    fileprivate func prepareCard() {
        detailCard = Card()
        
        prepareCardToolbar()
        prepareSheetIntro()
        
        detailCard.toolbar = cardToolbar
        detailCard.toolbarEdgeInsetsPreset = .square3
        detailCard.toolbarEdgeInsets.bottom = 0
        detailCard.toolbarEdgeInsets.right = 8
        
        detailCard.contentView = sheetIntro
        detailCard.contentViewEdgeInsetsPreset = .wideRectangle3
        
        view.layout(detailCard).top(0).left(0).width(view.width)
    }
}

extension SheetDetailController {
    @objc
    fileprivate func handleBackButton() {
        let window = self.view.window!
        window.rootViewController = firstView
    }
    
    @objc
    fileprivate func handleNextButton() {
    }
}
