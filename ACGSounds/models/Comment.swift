//
//  Comment.swift
//  ACGSounds
//
//  Created by David Chen on 30/05/2017.
//  Copyright © 2017 FropsVM Networks Limited. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Comment {
    var likeCount: Int
    var author: String
    var text: String
    var date: Date
    var _id: String
    
    init(json: JSON) {
        _id = json["_id"].stringValue
        text = json["text"].stringValue
        author = json["author"]["username"].stringValue
        likeCount = Int(json["likeCount"].numberValue)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.zzz'Z'"
        date = dateFormatter.date(from: json["lastUpdate"].stringValue)!
    }
}
