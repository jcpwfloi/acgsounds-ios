//
//  SecondViewController.swift
//  ACGSounds
//
//  Created by David Chen on 06/05/2017.
//  Copyright © 2017 FropsVM Networks Limited. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

var searchResultArray: [Sheet]?

class SecondViewController: UIViewController {
    
    @IBOutlet var searchTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func getSearchResultFromRemote(_ keyword: String) {
        Alamofire.request(baseUrl + "/search", method: .post).responseJSON {
            response in
            if let result = response.result.value {
                searchResultArray?.removeAll()
                for (_, subJSON): (String, JSON) in JSON(result) {
                    searchResultArray?.append(Sheet(json: subJSON))
                }
            }
        }
    }


}

extension SecondViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResultArray?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "searchCell", for: indexPath)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}
