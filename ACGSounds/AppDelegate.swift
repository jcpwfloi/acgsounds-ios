//
//  AppDelegate.swift
//  ACGSounds
//
//  Created by David Chen on 06/05/2017.
//  Copyright © 2017 FropsVM Networks Limited. All rights reserved.
//

import UIKit
import Material

let firstView = AppToolbarController(rootViewController: SheetsViewController())
let secondView = AppNavigationController(rootViewController: SheetDetailController())

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func applicationDidFinishLaunching(_ application: UIApplication) {
        window = UIWindow(frame: Screen.bounds)
        window!.rootViewController = firstView
        
        window!.makeKeyAndVisible()
    }

}

