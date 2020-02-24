//
//  SceneDelegate.swift
//  MVVM
//
//  Created by user on 1/22/20.
//  Copyright © 2020 VienH. All rights reserved.
//

import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    enum TypeScreen {
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

        let homeVC = HomeViewController()
        let homeNavi = UINavigationController(rootViewController: homeVC)
        homeNavi.tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "icons8-home-page-30"), selectedImage: UIImage(named: "icons8-home-page-30"))

        let messagesVC = FavoritesViewController()
        let messagesNavi = UINavigationController(rootViewController: messagesVC)
        messagesNavi.tabBarItem = UITabBarItem(title: "Messages", image: UIImage(named: "icons8-group-message-30"), selectedImage: UIImage(named: "icons8-group-message-30"))
        messagesNavi.tabBarItem.badgeValue = "99"
        messagesNavi.tabBarItem.badgeColor = .red

        let friendsVC = FriendsViewController()
        let friendsNavi = UINavigationController(rootViewController: friendsVC)
        friendsNavi.tabBarItem = UITabBarItem(title: "Friends", image: UIImage(named: "icons8-add-user-group-man-man-30"), tag: 2)
        friendsNavi.tabBarItem.badgeValue = "07"
        friendsNavi.tabBarItem.badgeColor = .red

        let profileVC = ProfilesViewController()
        let profileNavi = UINavigationController(rootViewController: profileVC)
        profileNavi.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(named: "icons8-user-male-30"), tag: 3)
        profileNavi.tabBarItem.badgeValue = "New"
        profileNavi.tabBarItem.badgeColor = .red

        let tabbarController = UITabBarController()
        tabbarController.viewControllers = [homeNavi, messagesNavi, friendsNavi, profileNavi]
        tabbarController.tabBar.tintColor = .red

        window?.rootViewController = tabbarController
    }

    func changeScreen(type: TypeScreen) {
        switch type {
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
