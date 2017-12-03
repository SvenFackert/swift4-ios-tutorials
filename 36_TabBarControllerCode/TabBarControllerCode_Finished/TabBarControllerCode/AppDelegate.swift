//
//  AppDelegate.swift
//  TabBarControllerCode
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
        
        let firstVC: FirstViewController = FirstViewController()
        firstVC.tabBarItem.title = "Phone 1"
        firstVC.tabBarItem.image = UIImage(named: "tab_phone")?.withRenderingMode(.alwaysOriginal)
        firstVC.tabBarItem.selectedImage = UIImage(named: "tab_phone_selected")?.withRenderingMode(.alwaysOriginal)
        let secondVC: SecondViewController = SecondViewController()
        secondVC.tabBarItem.title = "Phone 2"
        secondVC.tabBarItem.image = UIImage(named: "tab_phone")?.withRenderingMode(.alwaysOriginal)
        secondVC.tabBarItem.selectedImage = UIImage(named: "tab_phone_selected")?.withRenderingMode(.alwaysOriginal)
        let thirdVC: ThirdViewController = ThirdViewController()
        thirdVC.tabBarItem.title = "Phone 3"
        thirdVC.tabBarItem.image = UIImage(named: "tab_phone")?.withRenderingMode(.alwaysOriginal)
        thirdVC.tabBarItem.selectedImage = UIImage(named: "tab_phone_selected")?.withRenderingMode(.alwaysOriginal)
        let fourthVC: FourthViewController = FourthViewController()
        fourthVC.tabBarItem.title = "Phone 4"
        fourthVC.tabBarItem.image = UIImage(named: "tab_phone")?.withRenderingMode(.alwaysOriginal)
        fourthVC.tabBarItem.selectedImage = UIImage(named: "tab_phone_selected")?.withRenderingMode(.alwaysOriginal)
        let fifthVC: FifthViewController = FifthViewController()
        fifthVC.tabBarItem.title = "Phone 5"
        fifthVC.tabBarItem.image = UIImage(named: "tab_phone")?.withRenderingMode(.alwaysOriginal)
        fifthVC.tabBarItem.selectedImage = UIImage(named: "tab_phone_selected")?.withRenderingMode(.alwaysOriginal)
        let sixthVC: SixthViewController = SixthViewController()
        sixthVC.tabBarItem.title = "Phone 6"
        sixthVC.tabBarItem.image = UIImage(named: "tab_phone")?.withRenderingMode(.alwaysOriginal)
        sixthVC.tabBarItem.selectedImage = UIImage(named: "tab_phone_selected")?.withRenderingMode(.alwaysOriginal)
        
        let tabBarCon: UITabBarController = UITabBarController()
        tabBarCon.setViewControllers([firstVC, secondVC, thirdVC, fourthVC, fifthVC, sixthVC], animated: false)
        tabBarCon.tabBar.barTintColor = UIColor.init(red: 33.0/255.0, green: 167.0/255.0, blue: 255.0/255.0, alpha: 1.0)
        tabBarCon.tabBar.tintColor = UIColor.white
        tabBarCon.moreNavigationController.navigationBar.barTintColor = UIColor.init(red: 33.0/255.0, green: 167.0/255.0, blue: 255.0/255.0, alpha: 1.0)
        
        self.window = UIWindow()
        self.window!.rootViewController = tabBarCon
        self.window!.makeKeyAndVisible()
        
        return true
    }
}

