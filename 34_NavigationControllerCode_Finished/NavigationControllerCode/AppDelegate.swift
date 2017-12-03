//
//  AppDelegate.swift
//  NavigationControllerCode
//
//  Created by Daniel Lauer on 20/11/16.
//  Copyright © 2016 Daniel Lauer. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        let navCon: UINavigationController = UINavigationController(rootViewController: FirstViewController())
        navCon.navigationBar.barTintColor = UIColor.init(red: 33.0/255.0, green: 167.0/255.0, blue: 255.0/255.0, alpha: 1.0)
        navCon.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        navCon.navigationBar.tintColor = UIColor.white
        self.window = UIWindow()
        self.window!.rootViewController = navCon
        self.window!.makeKeyAndVisible()
        
        return true
    }

}

