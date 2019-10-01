//
//  AppDelegate.swift
//  Nostoryboard
//
//  Created by PCI0006 on 10/1/19.
//  Copyright © 2019 PCI0006. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        let vc = MyViewController()
        window?.rootViewController = vc
        window?.makeKeyAndVisible()
        return true
    }
}
