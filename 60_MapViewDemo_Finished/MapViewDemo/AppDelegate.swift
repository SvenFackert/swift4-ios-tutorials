//
//  AppDelegate.swift
//  MapViewDemo
//
//  Created by Daniel Lauer on 25/12/16.
//  Copyright © 2016 Daniel Lauer. All rights reserved.
//

import UIKit
import CoreLocation

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var locationManager: CLLocationManager?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    
        self.locationManager = CLLocationManager()
        self.locationManager?.requestWhenInUseAuthorization()
        
        return true
    }
}

