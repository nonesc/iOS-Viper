//
//  AppDelegate.swift
//  iOS-Viper
//
//  Created by Sujin on 11/3/2563 BE.
//  Copyright © 2563 Sujin. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let home = HomeViewWireFrame.createHome()

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = home
        window?.makeKeyAndVisible()
//        let vc = CustomVC()
        return true
    }


}
