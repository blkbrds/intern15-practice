//
//  SceneDelegate.swift
//  BaitapHomeScreen
//
//  Created by PCI0008 on 2/4/20.
//  Copyright © 2020 PCI0008. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let homeViewController = HomeViewController()
        homeViewController.tabBarItem = UITabBarItem(title: "Home", image: UIImage.init(systemName: "house.fill"), tag: 0)
        
        let mapViewController = MapViewController()
        mapViewController.tabBarItem = UITabBarItem(title: "Map", image: UIImage.init(systemName: "map"), tag: 1)
        
        let favoriteViewController = FavoriteViewController()
        favoriteViewController.tabBarItem = UITabBarItem(title: "Favorite", image: UIImage.init(systemName: "star.fill"), tag: 2)
        
        let profileViewController = ProfileViewController()
        profileViewController.tabBarItem = UITabBarItem(title: "Profile", image: UIImage.init(systemName: "person.circle"), tag: 3)
        
        window = UIWindow(windowScene: windowScene)
        window?.makeKeyAndVisible()
        window?.rootViewController = setupTabbar(homeViewController: homeViewController, mapViewController: mapViewController, favoriteViewController: favoriteViewController, profileViewController: profileViewController)
    }
    
    func setupTabbar(homeViewController: HomeViewController, mapViewController: MapViewController, favoriteViewController: FavoriteViewController, profileViewController: ProfileViewController) -> UITabBarController{
        let viewControllers = [UINavigationController(rootViewController: homeViewController), UINavigationController(rootViewController: mapViewController), UINavigationController(rootViewController: favoriteViewController), UINavigationController(rootViewController: profileViewController)]
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = viewControllers
        return tabBarController
    }
}

