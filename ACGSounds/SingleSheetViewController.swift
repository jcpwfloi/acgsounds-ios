//
//  SingleSheetViewController.swift
//  ACGSounds
//
//  Created by David Chen on 07/05/2017.
//  Copyright © 2017 FropsVM Networks Limited. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class SingleSheetViewController: UIViewController {

    private var singleSheetData: SingleSheet?
    
    func refreshView() {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.title = openSingleSheet?.sheetName
        
        let apiUrl: String = baseUrl + "/sheet/get/" + openSingleSheet!._id
        
        Alamofire.request(apiUrl, method: .post).responseJSON { response in
            if let answer = response.result.value {
                self.singleSheetData = SingleSheet(json: JSON(answer))
                print(self.singleSheetData!)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
