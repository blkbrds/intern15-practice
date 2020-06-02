//
//  SceneDelegate.swift
//  BaiTapMVVM
//
//  Created by PCI0012 on 6/2/20.
//  Copyright © 2020 PCI0012. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        let homeViewController = HomeViewController()
        let homeNavigationController = UINavigationController(rootViewController: homeViewController)
        homeNavigationController.tabBarItem = UITabBarItem(title: "Home", image: #imageLiteral(resourceName: "ic-home1"), selectedImage: #imageLiteral(resourceName: "ic-home2"))
        homeNavigationController.navigationBar.barTintColor = .white
        
        let mapViewController = MapViewController()
        let mapNavigationController = UINavigationController(rootViewController: mapViewController)
        mapNavigationController.tabBarItem = UITabBarItem(title: "Map", image: #imageLiteral(resourceName: "ic-map1"), selectedImage: #imageLiteral(resourceName: "ic-map2"))
        
        let favoriteController = FavoriteViewController()
        let favoriteNavigationController = UINavigationController(rootViewController: favoriteController)
        favoriteNavigationController.tabBarItem = UITabBarItem(title: "Favorite", image: #imageLiteral(resourceName: "ic-favorite1"), selectedImage: #imageLiteral(resourceName: "ic-favorite2"))
        
        let settingController = SettingViewController()
        let settingNavigationController = UINavigationController(rootViewController: settingController)
        settingNavigationController.tabBarItem = UITabBarItem(title: "Setting", image: #imageLiteral(resourceName: "ic-setting1"), selectedImage: #imageLiteral(resourceName: "ic-setting2"))
        
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        let viewControllers = [homeNavigationController, mapNavigationController, favoriteNavigationController, settingNavigationController]
        let tabBarController = UITabBarController()
        tabBarController.tabBar.tintColor = .black
        tabBarController.tabBar.unselectedItemTintColor = .black
        tabBarController.tabBar.barTintColor = .white
        tabBarController.viewControllers = viewControllers
        let navi = UINavigationController(rootViewController: tabBarController)
        navi.navigationBar.isHidden = true
        window.rootViewController = navi
        self.window = window
        window.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

