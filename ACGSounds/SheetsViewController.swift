//
//  SheetsViewController.swift
//  ACGSounds
//
//  Created by David Chen on 26/05/2017.
//  Copyright © 2017 FropsVM Networks Limited. All rights reserved.
//

import UIKit
import Material
import Alamofire
import SwiftyJSON

class SheetsViewController: UIViewController {
    /// View.
    internal var tableView: CardTableView!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Color.blueGrey.lighten5
        
        // Feed.
        prepareTableView()
    }
    
    open override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        reloadData()
    }
    
    open override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        reloadData()
    }
}

/// TableView.
extension SheetsViewController {
    internal func prepareTableView() {
        tableView = CardTableView()
        view.layout(tableView).edges()
    }
    
    internal func reloadData() {
        let parameters: Parameters = [
            "amount": "20",
            "skip": "0"
        ]
        
        var sheets = [Sheet]()
        
        Alamofire.request(baseUrl + "/sheet/get", method: .post, parameters: parameters).responseJSON { response in
            
            if let data = response.result.value {
                sheets.removeAll()
                
                for (_, subJson):(String, JSON) in JSON(data) {
                    sheets.append(Sheet(json: subJson))
                }
                
                self.tableView.data = sheets
            }
        }
    }
}
