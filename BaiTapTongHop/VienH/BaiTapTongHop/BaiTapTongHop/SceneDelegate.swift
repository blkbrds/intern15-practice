//
//  SceneDelegate.swift
//  BaiTapTongHop
//
//  Created by user on 4/28/20.
//  Copyright © 2020 VienH. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        // config tab Home
        let homeViewController = HomeViewController()
        let homeNavigationController = UINavigationController(rootViewController: homeViewController)
        homeNavigationController.tabBarItem = UITabBarItem(title: "Home", image: #imageLiteral(resourceName: "icons8-home-page-30"), selectedImage: #imageLiteral(resourceName: "icons8-home-page-30"))

        // config tab Map
        let mapViewController = MapViewController()
        let mapNavigationController = UINavigationController(rootViewController: mapViewController)
        mapNavigationController.tabBarItem = UITabBarItem(title: "Map", image: #imageLiteral(resourceName: "icons8-place-marker-30"), selectedImage: #imageLiteral(resourceName: "icons8-place-marker-30"))

        // config tab Favorites
        let favoriteViewController = FavoriteViewController()
        let favoriteNavigationController = UINavigationController(rootViewController: favoriteViewController)
        favoriteNavigationController.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)

        // config tab bar controller
        let viewControllers = [homeNavigationController, mapNavigationController, favoriteNavigationController]
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = viewControllers

        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = tabBarController
        self.window = window
        window.makeKeyAndVisible()
    }
}
