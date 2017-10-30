//
//  AppDelegate.swift
//  AutoLayoutIntroductionCode
//
//  Created by Daniel Lauer on 12/11/16.
//  Copyright © 2016 Daniel Lauer. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow()
        self.window!.rootViewController = ViewController(nibName: nil, bundle: nil)
        self.window!.makeKeyAndVisible()
        
        return true
    }
}

