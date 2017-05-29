//
//  Sheet.swift
//  ACGSounds
//
//  Created by David Chen on 06/05/2017.
//  Copyright © 2017 FropsVM Networks Limited. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Sheet {
    var sheetName: String
    var _id: String
    var author: String
    var lastUpdate: Date?
    var sheetIntro: String
    init (json: JSON) {
        _id = json["_id"].stringValue
        sheetName = json["sheetName"].stringValue
        author = json["user"]["username"].stringValue
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.zzz'Z'"
        lastUpdate = dateFormatter.date(from: json["lastUpdate"].stringValue)
        sheetIntro = json["sheetIntro"].stringValue
    }
}
