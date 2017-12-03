//
//  AppDelegate.swift
//  TabBarController
//
//  Created by Daniel Lauer on 20/11/16.
//  Copyright © 2016 Daniel Lauer. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
       
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedStringKey.foregroundColor: UIColor.init(red: 0.0/255.0, green: 122.0/255.0, blue: 255.0/255.0, alpha: 1.0)], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedStringKey.foregroundColor: UIColor.white], for: .selected)
        
        return true
    }

}

