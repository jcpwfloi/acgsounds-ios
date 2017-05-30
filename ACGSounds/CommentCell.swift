//
//  CommentCell.swift
//  ACGSounds
//
//  Created by David Chen on 30/05/2017.
//  Copyright © 2017 FropsVM Networks Limited. All rights reserved.
//

import UIKit
import Material

class CommentCell: TableViewCell {
    public var data: Comment? {
        didSet {
            layoutSubviews()
        }
    }
    
    public var numberIndicated: Int?
    
    open override var height: CGFloat {
        get {
            return card.height + spacing
        }
        set(value) {
            super.height = value
        }
    }
    
    private var spacing: CGFloat = 10
    
    public var isLast = false
    
    private var card: Card!
    
    private var toolbar: Toolbar!
    private var moreButton: IconButton!
    
    private var insideView: UILabel!
    
    private var bottomBar: Bar!
    private var dateFormatter: DateFormatter!
    private var favoriteButton: IconButton!
    private var numberIndicator: UILabel!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        guard let d = data else {
            return
        }
        
        toolbar.title = d.author
        
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        toolbar.detail = dateFormatter.string(from: d.date)
        
        insideView.text = d.text
        
        numberIndicator.text = "#" + String(numberIndicated ?? 0)
        
        card.x = 0
        card.y = 0
        card.width = width
        
        card.setNeedsLayout()
        card.layoutIfNeeded()
    }
    
    open override func prepare() {
        super.prepare()
        
        layer.rasterizationScale = Screen.scale
        layer.shouldRasterize = true
        
        pulseAnimation = .none
        backgroundColor = nil
        
        prepareDateFormatter()
        prepareFavoriteButton()
        prepareMoreButton()
        prepareToolbar()
        prepareInsideView()
        prepareBottomBar()
        prepareImageCard()
    }
    
    private func prepareDateFormatter() {
        dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
    }
    
    private func prepareFavoriteButton() {
        favoriteButton = IconButton(image: Icon.favorite, tintColor: Color.red.base)
    }
    
    private func prepareMoreButton() {
        moreButton = IconButton(image: Icon.cm.moreVertical, tintColor: Color.grey.base)
    }
    
    private func prepareToolbar() {
        toolbar = Toolbar(rightViews: [moreButton])
        
        toolbar.titleLabel.textAlignment = .left
        toolbar.detailLabel.textAlignment = .left
        toolbar.detailLabel.textColor = Color.grey.base
    }
    
    private func prepareInsideView() {
        insideView = UILabel()
        insideView.numberOfLines = 0
        insideView.font = RobotoFont.regular(with: 14)
    }
    
    private func prepareBottomBar() {
        bottomBar = Bar()
        
        numberIndicator = UILabel()
        numberIndicator.font = RobotoFont.regular(with: 12)
        numberIndicator.textColor = Color.grey.base
        
        bottomBar.rightViews = [numberIndicator]
    }
    
    private func prepareImageCard() {
        card = Card()
        
        card.toolbar = toolbar
        card.toolbarEdgeInsetsPreset = .square3
        card.toolbarEdgeInsets.bottom = 0
        card.toolbarEdgeInsets.right = 8
        
        card.contentView = insideView
        card.contentViewEdgeInsetsPreset = .wideRectangle3
        
        card.bottomBar = bottomBar
        card.bottomBarEdgeInsetsPreset = .wideRectangle2
        
        contentView.addSubview(card)
    }
}
