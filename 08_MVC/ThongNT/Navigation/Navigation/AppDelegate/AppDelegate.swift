//
//  AppDelegate.swift
//  PracticeTemplate

import UIKit

@UIApplicationMain
final class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let vc = HomeViewController()
        let navigation = BaseNavigationController(rootViewController: vc)
        
        window!.rootViewController = navigation
        window!.makeKeyAndVisible()
        return true
    }
}

