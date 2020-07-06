//
//  SceneDelegate.swift
//  TabbarController
//
//  Created by PCI0019 on 7/6/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit
import SwiftUI

enum RootViewController {
    case login
    case tabbar
}

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    static var shared: SceneDelegate {
        guard let scene = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate else {
            fatalError("Can not case scene delegate")
        }
        return scene
    }
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowSence = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowSence)
        
        let navi = UINavigationController(rootViewController: LoginNavigationViewController())
        window.rootViewController = navi
        self.window = window
        window.makeKeyAndVisible()
    }

    func changeRoot(root: RootViewController) {
        switch root {
        case .login:
            window?.rootViewController = LoginNavigationViewController()
        default:
            window?.rootViewController = setupTabbar()
        }
        window?.makeKeyAndVisible()
    }

    func setupTabbar() -> UITabBarController {
        
        let homeVC = HomeViewController2()
        let homeNavi = UINavigationController(rootViewController: homeVC)
        homeNavi.tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "homefill"), selectedImage: UIImage(named: "home"))
        homeNavi.tabBarItem.badgeValue = "99"
        
        let mapVC = MapViewController2()
        let mapNavi = UINavigationController(rootViewController: mapVC)
        mapNavi.tabBarItem = UITabBarItem(title: "Map", image: UIImage(named: "map"), selectedImage: UIImage(named: "mapfill"))
        mapNavi.tabBarItem.badgeValue = "DaNang"
        
        
        let favoritesVC = FavoritesViewController2()
        let favoritesNavi = UINavigationController(rootViewController: favoritesVC)
        favoritesNavi.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 2)
        favoritesNavi.tabBarItem.badgeValue = "11"
        
        let profileVC = ProfileViewController2()
        let profileNavi = UINavigationController(rootViewController: profileVC)
        profileVC.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(named: "profile"), selectedImage: UIImage(named: "profilefill"))
        
        let tabbarController = UITabBarController()
        tabbarController.viewControllers = [homeNavi, mapNavi, favoritesNavi, profileNavi]
        return tabbarController
    }
}
