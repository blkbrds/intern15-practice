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
    
    private override init() {
        super.init()
    }

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        print("connection")
        guard let windowScene = (scene as? UIWindowScene) else { return }
       window = UIWindow(windowScene: windowScene)
        if UserDefaults.standard.value(forKey: "username") != nil {
            configTabBar()
        } else {
            configLoginNavi()
        }
        window?.makeKeyAndVisible()
    }
    
    func configRootView(status: Status) {
        switch status {
        case .login:
            configTabBar()
        case .logOut:
            configLoginNavi()
        }
    }
    
    private func configLoginNavi() {
        let loginVC = LoginViewController()
        let loginNavi = BaseNavigationController(rootViewController: loginVC)
        window?.rootViewController = loginNavi
    }
    
    private func configTabBar() {
        let homeVC = HomeViewController()
        let homeNavi = UINavigationController(rootViewController: homeVC)
//        homeNavi.tabBarItem = UITabBarItem(tabBarSystemItem: .featured, tag: 0)
        homeNavi.tabBarItem = UITabBarItem(title: "Home", image: #imageLiteral(resourceName: "ic-home"), selectedImage: #imageLiteral(resourceName: "ic-home-selected"))
        
        let mapVC = MapViewController()
        let mapNavi = UINavigationController(rootViewController: mapVC)
        mapNavi.tabBarItem = UITabBarItem(title: "Map", image: #imageLiteral(resourceName: "ic-map"), selectedImage: #imageLiteral(resourceName: "ic-map-selected"))
        
        let favoriteVC = FavoriteViewController()
        let favoriteNavi = UINavigationController(rootViewController: favoriteVC)
        favoriteNavi.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 0)
        
        let profileVC = ProfileViewController()
        let profileNavi = UINavigationController(rootViewController: profileVC)
        profileNavi.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 0)
        
        let tabBarController = BaseTabBarController()
        tabBarController.viewControllers = [homeNavi, mapNavi, favoriteNavi, profileNavi]
        window?.rootViewController = tabBarController
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

