//
//  ViewController.swift
//  TabBarController
//
//  Created by Daniel Lauer on 20/11/16.
//  Copyright © 2016 Daniel Lauer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //self.tabBarController?.tabBar.barTintColor = UIColor.red
        self.tabBarController?.moreNavigationController.navigationBar.barTintColor = UIColor.init(red: 33.0/255.0, green: 167.0/255.0, blue: 255.0/255.0, alpha: 1.0)
    }
}

