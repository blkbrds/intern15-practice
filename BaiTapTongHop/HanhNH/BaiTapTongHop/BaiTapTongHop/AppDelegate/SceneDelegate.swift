//
//  SceneDelegate.swift
//  BaiTapTongHop
//
//  Created by ANH NGUYỄN on 12/13/19.
//  Copyright © 2019 asiantech. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        self.window = window
        window.makeKeyAndVisible()
        createTabbar()
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
}

extension SceneDelegate {
    func createTabbar() {
        //Home
        let homeVC = HomeViewController()
        let homeNavi = UINavigationController(rootViewController: homeVC)
        homeNavi.tabBarItem = UITabBarItem(title: "Home", image: #imageLiteral(resourceName: "ic-tabbar-home"), tag: 0)
        //Map
        let mapVC = MapViewController()
        let mapNavi = UINavigationController(rootViewController: mapVC)
        mapNavi.tabBarItem = UITabBarItem(title: "Map", image: #imageLiteral(resourceName: "ic-tabbar-map"), tag: 1)
        //favorite
        let favoriteVC = FavoriteViewController()
        let favoriteNavi = UINavigationController(rootViewController: favoriteVC)
        favoriteNavi.tabBarItem = UITabBarItem(title: "Favorite", image: #imageLiteral(resourceName: "ic-tabbar-favorites"), tag: 2)
        //profile
        let profileVC = ProfileViewController()
        let profileNavi = UINavigationController(rootViewController: profileVC)
        profileNavi.tabBarItem = UITabBarItem(title: "Profile", image: #imageLiteral(resourceName: "ic-tabbar-profile"), tag: 3)
        //show TabBar
        let tabbarController = BaseTabBarController()
        tabbarController.viewControllers = [homeNavi, mapNavi, favoriteNavi, profileNavi]
        tabbarController.tabBar.tintColor = .black
        self.window?.rootViewController = tabbarController
    }
}

