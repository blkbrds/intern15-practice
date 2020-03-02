//
//  SceneDelegate.swift
//  BaiTapTongHop
//
//  Created by PCI0018 on 11/22/19.
//  Copyright © 2019 Asian Tech. All rights reserved.
//

import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        // config tab Home
        let homeViewController = HomeViewController()
        let homeNavigationController = UINavigationController(rootViewController: homeViewController)
        homeNavigationController.tabBarItem = UITabBarItem(title: "Home", image: #imageLiteral(resourceName: "tabbar_icon_home_png.png"), selectedImage: #imageLiteral(resourceName: "tabbar_icon_home_selected_png.png"))
        
        // config tab Map
        let mapViewController = MapViewController()
        let mapNavigationController = UINavigationController(rootViewController: mapViewController)
        mapNavigationController.tabBarItem = UITabBarItem(title: "Map", image: #imageLiteral(resourceName: "tabbar_icon_map_png.png"), selectedImage: #imageLiteral(resourceName: "tabbar_icon_map_selected_png.png"))
        
        // config tab Favorites
        let favoritesViewController = FavoritesViewController()
        let favoritesNavigationController = UINavigationController(rootViewController: favoritesViewController)
        favoritesNavigationController.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
        
        // config tab Profile
        let profileViewController = ProfileViewController()
        let profileNavigationController = UINavigationController(rootViewController: profileViewController)
        profileViewController.tabBarItem = UITabBarItem(title: "Profile", image: #imageLiteral(resourceName: "tabbar_icon_profile_png.png"), selectedImage: #imageLiteral(resourceName: "tabbar_icon_profile_selected_png.png"))
        
        // config tab bar controller
        let viewControllers = [homeNavigationController, mapNavigationController, favoritesNavigationController, profileNavigationController]
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = viewControllers
        
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = tabBarController
        self.window = window
        window.makeKeyAndVisible()
    }
}
