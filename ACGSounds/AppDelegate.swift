//
//  AppDelegate.swift
//  ACGSounds
//
//  Created by David Chen on 06/05/2017.
//  Copyright © 2017 FropsVM Networks Limited. All rights reserved.
//

import UIKit
import Material

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    
    func applicationDidFinishLaunching(_ application: UIApplication) {
        window = UIWindow(frame: Screen.bounds)
        
        let sheetsViewController = SheetsViewController()
        
        window!.rootViewController = AppToolbarController(rootViewController: sheetsViewController)
        window!.makeKeyAndVisible()
    }

}

