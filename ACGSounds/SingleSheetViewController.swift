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
import PDFReader

var singleSheetData: SingleSheet?

class SingleSheetViewController: UIViewController {
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var openPDF: UIButton!
    
    @IBAction func openPDFView() {
        //self.performSegue(withIdentifier: "sheetPDFView", sender: self)
        let remotePDFDocumentURLPath = singleSheetData!.pdfUrl
        let remotePDFDocumentURL = URL(string: remotePDFDocumentURLPath)!
        let document = PDFDocument(url: remotePDFDocumentURL)!
        let readerController = PDFViewController.createNew(with: document)
        navigationController?.pushViewController(readerController, animated: true)
    }
    
    private func refreshSize() {
        let screenSize = UIScreen.main.bounds
        
        var frame = self.textView.frame
        frame.size.height = self.textView.contentSize.height + 20
        frame.size.width = screenSize.width - 20
        self.textView.frame = frame
        
        frame = self.openPDF.frame
        frame.origin.x = (screenSize.width - frame.size.width) / 2
        frame.origin.y = self.textView.frame.origin.y + self.textView.frame.size.height
        frame.origin.y = frame.origin.y + 8
        
        self.openPDF.frame = frame
    }
    
    private func refreshView() {
        /* @function refreshView
            Synchronize the view with the data
        */
        let apiUrl: String = baseUrl + "/sheet/get/" + openSingleSheet!._id
        
        Alamofire.request(apiUrl, method: .post).responseJSON { response in
            if let answer = response.result.value {
                singleSheetData = SingleSheet(json: JSON(answer))
                
                self.textView.text =
                    "Sheet Name: \(singleSheetData?.sheetName ?? "")\n" +
                    "Author: \(singleSheetData?.author ?? "")\n"
                
                self.textView.text = self.textView.text + "Sheet Description:\n\(singleSheetData?.description ?? "")"
                
                self.refreshSize()
            }
        }
    }
    
    override func viewDidLayoutSubviews() {
        self.refreshSize()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.title = openSingleSheet?.sheetName
        
        refreshView()
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
