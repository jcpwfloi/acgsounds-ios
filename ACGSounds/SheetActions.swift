//
//  SheetActions.swift
//  ACGSounds
//
//  Created by David Chen on 27/05/2017.
//  Copyright © 2017 FropsVM Networks Limited. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

func getSheetById(_ _id: String, completionHandler: @escaping (_ sheet: SingleSheet) -> Void) {
    Alamofire.request(baseUrl + "/sheet/get/" + _id, method: .post).responseJSON { response in
        if let result = response.result.value {
            completionHandler(SingleSheet(json: JSON(result)))
        }
    }
}

func getSheetByPage(_ page: Int, completionHandler: @escaping (_ sheets: [Sheet]) -> Void) {
    let parameters: Parameters = [
        "amount": "20",
        "skip": String((page - 1) * 20)
    ]
    
    Alamofire.request(baseUrl + "/sheet/get", method: .post, parameters: parameters).responseJSON { response in
        if let result = response.result.value {
            let jsonResult = JSON(result)
            
            var answer = [Sheet]()
            
            for (_, subJSON) in jsonResult {
                answer.append(Sheet(json: subJSON))
            }
            
            completionHandler(answer)
        }
    }
}
