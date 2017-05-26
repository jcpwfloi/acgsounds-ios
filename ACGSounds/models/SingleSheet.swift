//
//  SingleSheet.swift
//  ACGSounds
//
//  Created by David Chen on 08/05/2017.
//  Copyright © 2017 FropsVM Networks Limited. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire

struct SingleSheet {
    var sheetName: String
    var _id: String
    var author: String
    var createdAt: Date?
    var sheetTag: [String]
    var description: String
    var midiUrl: String
    var pdfUrl: String

    init (json: JSON) {
        _id = json["_id"].stringValue
        sheetName = json["sheetName"].stringValue
        author = json["user"]["username"].stringValue
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.zzz'Z'"
        createdAt = dateFormatter.date(from: json["createdAt"].stringValue)
        sheetTag = json["sheetTag"].arrayObject as! [String]
        description = json["sheetIntro"].stringValue
        midiUrl = json["midiUrl"].stringValue
        pdfUrl = json["pdfUrl"].stringValue
    }
}
