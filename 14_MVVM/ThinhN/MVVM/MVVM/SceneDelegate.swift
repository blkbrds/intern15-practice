//
//  SceneDelegate.swift
//  MVVM
//
//  Created by PCI0019 on 7/7/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowSence = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowSence)
        window.rootViewController = setupTabbar()
        self.window = window
        window.makeKeyAndVisible()
    }
    func setupTabbar() -> UITabBarController {
        
        let homeVC = HomeViewController()
        let homeNavi = UINavigationController(rootViewController: homeVC)
        homeNavi.tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "home"), selectedImage: UIImage(named: "homefill"))
        
        let mapVC = MapViewController()
        let mapNavi = UINavigationController(rootViewController: mapVC)
        mapNavi.tabBarItem = UITabBarItem(title: "Map", image: UIImage(named: "map"), selectedImage: UIImage(named: "mapfill"))
        
        let favoritesVC = FavoritesViewController()
        let favoritesNavi = UINavigationController(rootViewController: favoritesVC)
        favoritesNavi.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 2)
        
        let profileVC = ProfileViewController()
        let profileNavi = UINavigationController(rootViewController: profileVC)
        profileVC.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(named: "profile"), selectedImage: UIImage(named: "profilefill"))
        
        let tabbarController = UITabBarController()
        tabbarController.viewControllers = [homeNavi, mapNavi, favoritesNavi, profileNavi]
        return tabbarController
    }
}

