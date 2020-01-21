//
//  SceneDelegate.swift
//  baitapMVVM
//
//  Created by user on 1/21/20.
//  Copyright © 2020 VienH. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    enum TypeScreen {
        case login
        case tabbar
    }

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        self.window = window
        window.makeKeyAndVisible()
        
        changeScreen(type: .tabbar)
    }

    func sceneDidDisconnect(_ scene: UIScene) {
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
    }

    func sceneWillResignActive(_ scene: UIScene) {
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
    }

    private func createTabbar() {
        //Home
        let homeVC = HomeViewController()
        let homeNavi = UINavigationController(rootViewController: homeVC)
        homeNavi.tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "icons8-home-page-30"), selectedImage: UIImage(named: "icons8-home-page-30"))
        
        //Messages
        let messagesVC = MessagesViewController()
        let messagesNavi = UINavigationController(rootViewController: messagesVC)
        messagesNavi.tabBarItem = UITabBarItem(title: "Messages", image: UIImage(named: "icons8-group-message-30"), selectedImage: UIImage(named: "icons8-group-message-30" ))
        messagesNavi.tabBarItem.badgeValue = "99"
        messagesNavi.tabBarItem.badgeColor = .red
        
        //Friends
        let friendsVC = FriendsViewController()
        let friendsNavi = UINavigationController(rootViewController: friendsVC)
        friendsNavi.tabBarItem = UITabBarItem(title: "Friends", image: UIImage(named: "icons8-add-user-group-man-man-30"), tag: 2)
        friendsNavi.tabBarItem.badgeValue = "11"
        friendsNavi.tabBarItem.badgeColor = .red
        
        //Profile
        let profileVC = ProfilesViewController()
        let profileNavi = UINavigationController(rootViewController: profileVC)
        profileNavi.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(named: "icons8-user-male-30"), tag: 3)
        profileNavi.tabBarItem.badgeValue = "New"
        profileNavi.tabBarItem.badgeColor = .red
        
        //tabbar controller
        let tabbarController = UITabBarController()
        tabbarController.viewControllers = [homeNavi, messagesNavi, friendsNavi, profileNavi]
        tabbarController.tabBar.tintColor = .red
        
        window!.rootViewController = tabbarController
    }
    
    private func createLogin() {
        let loginVC = LoginViewController()
        let loginNavi = BaseNavigationController(rootViewController: loginVC)
        
        window?.rootViewController = loginNavi
    }
    
    func changeScreen(type: TypeScreen) {
        switch type {
        case .login:
            createLogin()
        case .tabbar:
            createTabbar()
        }
    }
}

extension SceneDelegate: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        print("Selected Tab : \(tabBarController.selectedIndex)")
    }
}
