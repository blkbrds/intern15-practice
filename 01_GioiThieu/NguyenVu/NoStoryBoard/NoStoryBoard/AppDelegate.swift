//
//  AppDelegate.swift
//  NoStoryBoard
//
//  Created by PCI0020 on 9/28/1398 AP.
//  Copyright © 1398 PCI0020. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        let vc = HomeViewController()
        window?.rootViewController = vc
        window?.makeKeyAndVisible()
        
        return true
    }

    // MARK: UISceneSession Lifecycle


}

