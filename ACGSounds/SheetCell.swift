//
//  SheetCell.swift
//  ACGSounds
//
//  Created by David Chen on 07/05/2017.
//  Copyright © 2017 FropsVM Networks Limited. All rights reserved.
//

import UIKit
import SwiftyJSON

class SheetCell: UITableViewCell {

    @IBOutlet weak var sheetName: UILabel!
    @IBOutlet weak var author: UILabel!
    
    
    func makeCell (sheet: Sheet) {
        sheetName.text = sheet.sheetName
        author.text = sheet.author
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
