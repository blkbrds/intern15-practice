//
//  AppDelegate.swift
//  Baitap10
//
//  Created by Chinh Le on 12/19/19.
//  Copyright © 2019 Thang Le. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        window?.makeKeyAndVisible()
        
        let homeViewController = HomeViewController()
        window?.rootViewController = homeViewController

        return true
    }
}

