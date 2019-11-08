//
//  SceneDelegate.swift
//  abc
//
//  Created by PhuocNguyen on 10/22/19.
//  Copyright © 2019 PhuocNguyen. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate, UIApplicationDelegate {
    
    enum Status {
        case login
        case logOut
    }
    
    var window: UIWindow?
    
    static var shared: SceneDelegate {
        guard let shared = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate else { fatalError("Can not cast scene delegate") }
        return shared
    }
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        print("connection")
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        configTabBar()
        window?.makeKeyAndVisible()
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        print("Did Dis COnnect")
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
        print("Did Become Active")
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
        print("Will Resign Active")
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
        print("Will enter foreground")
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        print("DidEnterBackground")
    }
}

//MARK: -Config RootView
extension SceneDelegate {

    private func configTabBar() {
        let homeVC = HomeViewController()
        let homeNavi = BaseNavigationController(rootViewController: homeVC)
        homeNavi.tabBarItem = UITabBarItem(title: "Home", image: #imageLiteral(resourceName: "ic-home"), selectedImage: #imageLiteral(resourceName: "ic-grid"))
        
        let mapVC = MapViewController()
        let mapNavi = BaseNavigationController(rootViewController: mapVC)
        mapNavi.tabBarItem = UITabBarItem(title: "Map", image: #imageLiteral(resourceName: "ic-map"), selectedImage: #imageLiteral(resourceName: "ic-map-selected"))
        
        let favoriteVC = FavoriteViewController()
        let favoriteNavi = BaseNavigationController(rootViewController: favoriteVC)
        favoriteNavi.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 0)
        
        let profileVC = ProfileViewController()
        let profileNavi = BaseNavigationController(rootViewController: profileVC)
        profileNavi.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 0)
        
        let tabBarController = BaseTabBarController()
        tabBarController.viewControllers = [homeNavi, mapNavi, favoriteNavi, profileNavi]
        window?.rootViewController = tabBarController
    }
}

