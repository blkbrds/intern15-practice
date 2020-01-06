//
//  AppDelegate.swift
//  gioithieu
//
//  Created by PCI0006 on 9/29/1398 AP.
//  Copyright © 1398 PCI0006. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        let vc = MyViewController()
        window?.rootViewController = vc
        window?.makeKeyAndVisible()
        return true
    }

   


}

