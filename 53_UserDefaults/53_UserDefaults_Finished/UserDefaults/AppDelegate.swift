//
//  AppDelegate.swift
//  UserDefaults
//
//  Created by Daniel Lauer on 05/12/16.
//  Copyright © 2016 Daniel Lauer. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        let tabBarController: UITabBarController? = self.window?.rootViewController as? UITabBarController
        
        if tabBarController != nil {
            tabBarController?.delegate = self
            if tabBarController!.viewControllers != nil {
                for i in 0 ..< tabBarController!.viewControllers!.count {
                    let vc: UIViewController = tabBarController!.viewControllers![i]
                    vc.tabBarItem.tag = i
                }
            }
        }
        
        let defaults: UserDefaults = UserDefaults.standard
        let tabOrder: [Int]? = defaults.object(forKey: "tabOrder") as? [Int]
        
        if tabOrder != nil {
            var vcOrder: [UIViewController] = []
            for tag: Int in tabOrder! {
                for vc in tabBarController!.viewControllers! {
                    if vc.tabBarItem.tag == tag {
                        vcOrder.append(vc)
                    }
                }
            }
            tabBarController?.viewControllers = vcOrder
        }
        
        return true
    }
}


extension AppDelegate: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didEndCustomizing viewControllers: [UIViewController], changed: Bool) {
        if changed {
            var tabOrder: [Int] = []
            
            for vc: UIViewController in viewControllers {
                tabOrder.append(vc.tabBarItem.tag)
            }
            
            let defaults: UserDefaults = UserDefaults.standard
            defaults.set(tabOrder, forKey: "tabOrder")
        }
    }
}
