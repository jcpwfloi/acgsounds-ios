//
//  FirstViewController.swift
//  ACGSounds
//
//  Created by David Chen on 06/05/2017.
//  Copyright © 2017 FropsVM Networks Limited. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

let baseUrl = "http://api.acgsounds.com/Chardonnay"
var openSingleSheet: Sheet?

class NewSheetViewController: UIViewController {

    @IBOutlet weak var sheetView: UITableView!
    
    var sheetData = [Sheet]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let parameters: Parameters = [
            "amount": "20",
            "skip": "0"
        ]
        
        Alamofire.request(baseUrl + "/sheet/get", method: .post, parameters: parameters).responseJSON { response in
            if let answer = response.result.value {
                print("JSON: \(JSON(answer))")
                
                self.sheetData.removeAll()
                
                for (_, subJson):(String, JSON) in JSON(answer) {
                    self.sheetData.append(Sheet(json: subJson))
                }
                
                self.sheetView.reloadData()
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension NewSheetViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.sheetData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "sheetCell", for: indexPath) as! SheetCell
        
        cell.makeCell(sheet: self.sheetData[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        openSingleSheet = self.sheetData[indexPath.row]
        self.performSegue(withIdentifier: "SingleSheetSegue", sender: self)
    }
}

