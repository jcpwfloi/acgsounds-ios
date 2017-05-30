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

func searchSheetByKeyword(_ keyword: String, completionHandler: @escaping (_ sheets: [Sheet]) -> Void) {
    let parameters: Parameters = [
        "page": "1",
        "docsPerPage": "10"
    ]
    
    let preflightURL = baseUrl + "/sheet/search/" + keyword
    let url = preflightURL.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)
    
    Alamofire.request(url!, method: .post, parameters: parameters).responseJSON { response in
        if let result = response.result.value {
            let notCheckedResult = JSON(result)
            let jsonResult = notCheckedResult["data"]
            
            var answer = [Sheet]()
            
            for (_, subJSON) in jsonResult {
                answer.append(Sheet(json: subJSON))
            }
            
            completionHandler(answer)
        }
    }
}

func getCommentsBySheetIdAndPage(_ _id: String, commentPage page: Int, completionHandler: @escaping (_ sheets: [Comment]) -> Void) {
    let parameters: Parameters = [
        "page": String(page),
        "docsPerPage": "10"
    ]
    
    Alamofire.request(baseUrl + "/comment/bySheet/" + _id, method: .post, parameters: parameters).responseJSON { response in
        if let result = response.result.value {
            let jsonResult = JSON(result)
            
            var answer = [Comment]()
            
            for (_, subJSON) in jsonResult {
                answer.append(Comment(json: subJSON))
            }
            
            completionHandler(answer)
        }
    }
}



