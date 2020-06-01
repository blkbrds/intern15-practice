//
//  SceneDelegate.swift
//  BaiTap1
//
//  Created by PCI0012 on 6/1/20.
//  Copyright © 2020 PCI0012. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        //config tab home
        let homeViewController = HomeViewController()
        let homeNavigationController = UINavigationController(rootViewController: homeViewController)
        homeNavigationController.tabBarItem = UITabBarItem(title: "Home", image: #imageLiteral(resourceName: "ic-home1"), selectedImage: #imageLiteral(resourceName: "ic-home2"))
        
        //config tab favorites
        let favoritesViewController = FavoritesViewController()
        let favoritesNavigationController = UINavigationController(rootViewController: favoritesViewController)
        favoritesNavigationController.tabBarItem = UITabBarItem(title: "Favorite", image: UIImage(systemName: "suit.heart"), selectedImage: UIImage(systemName: "suit.heart.fill"))
        
        //config tab map
        let mapViewController = MapViewController()
        let mapNavigationController = UINavigationController(rootViewController: mapViewController)
        mapNavigationController.tabBarItem = UITabBarItem(title: "Map", image: #imageLiteral(resourceName: "ic-map1"), selectedImage: #imageLiteral(resourceName: "ic-map2"))
        
        //config tab profile
        let profileViewController = ProfileViewController()
        let profileNavigationController = UINavigationController(rootViewController: profileViewController)
        profileNavigationController.tabBarItem = UITabBarItem(title: "Profile", image: #imageLiteral(resourceName: "ic-profile1"), selectedImage: #imageLiteral(resourceName: "ic-profile2"))
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        let viewControllers = [homeNavigationController, favoritesNavigationController, mapNavigationController, profileNavigationController]
        let tabBarController = UITabBarController()
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

