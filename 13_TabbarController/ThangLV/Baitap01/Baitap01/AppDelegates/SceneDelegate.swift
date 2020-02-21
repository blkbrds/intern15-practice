//
//  SceneDelegate.swift
//  Baitap01
//
//  Created by PCI0008 on 1/16/20.
//  Copyright © 2020 PCI0008. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let homeViewController = HomeViewController()
        let homeNavigationController = UINavigationController(rootViewController: homeViewController)
        homeNavigationController.tabBarItem = UITabBarItem(tabBarSystemItem: .featured, tag: 0)
        
        let friendsViewController = FriendsViewController()
        let friendsNavigationController = UINavigationController(rootViewController: friendsViewController)
        friendsNavigationController.tabBarItem = UITabBarItem(title: "Friends", image: UIImage(named: "home"), selectedImage: UIImage(named: "home"))
        
        let messagesViewController = MessagesViewController()
        let messagesNavigationController = UINavigationController(rootViewController: messagesViewController)
        messagesNavigationController.tabBarItem = UITabBarItem(title: "Messages", image: UIImage(named: "favorites"), selectedImage: UIImage(named: "favorites"))
        
        let settingViewController = SettingViewController()
        
        
        let viewControllers = [homeNavigationController, friendsNavigationController, messagesNavigationController, settingViewController]
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = viewControllers
        
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = tabBarController
        window?.backgroundColor = .white
        window?.makeKeyAndVisible()
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

