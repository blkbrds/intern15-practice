//
//  SceneDelegate.swift
//  TabBar
//
//  Created by PhuocNguyen on 10/23/19.
//  Copyright © 2019 PhuocNguyen. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate, UIApplicationDelegate {
    
    enum AppStatus {
        case login
        case logOut
    }
    
    static var shared: SceneDelegate {
        guard let scene = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate else {
            fatalError("Can not case scene delegate")
        }
        return scene
    }
    
    private override init() {
        super.init()
    }
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        if UserDefaults.standard.value(forKey: "userName") != nil {
            configRootView(with: .login)
        } else {
            configRootView(with: .logOut)
        }
        window?.makeKeyAndVisible()
    }
    
    func configRootView(with status: AppStatus) {
        switch status {
        case .login:
            login()
        case .logOut:
            logOut()
        }
    }
    
    func logOut() {
        let loginVC = LoginViewController()
        let navi = UINavigationController(rootViewController: loginVC)
        window?.rootViewController = navi
    }
    
    func login() {
        let homeVC = HomeViewController()
        let homeNavi = UINavigationController(rootViewController: homeVC)
        homeNavi.tabBarItem = UITabBarItem(title: "Home", image: #imageLiteral(resourceName: "ic-home"), selectedImage: #imageLiteral(resourceName: "ic-home-selected"))
        
        let mapVC = MapViewController()
        let mapNavi = UINavigationController(rootViewController: mapVC)
        mapNavi.tabBarItem = UITabBarItem(title: "Map", image: #imageLiteral(resourceName: "ic-map"), selectedImage: #imageLiteral(resourceName: "ic-map-selected"))
        
        let settingVC = SettingViewController()
        let settingNavi = UINavigationController(rootViewController: settingVC)
        settingNavi.tabBarItem = UITabBarItem(title: "Setting", image: #imageLiteral(resourceName: "ic-setting"), selectedImage: #imageLiteral(resourceName: "ic-setting-selected"))
        
        let profileVC = ProfileViewController()
        let profileNavi = UINavigationController(rootViewController: profileVC)
        profileNavi.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 0)
        
        let tabBarController = BaseTabBarController()
        tabBarController.viewControllers = [homeNavi, mapNavi, settingNavi, profileNavi]
        window?.rootViewController = tabBarController
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {}
    
    func sceneDidBecomeActive(_ scene: UIScene) {}
    
    func sceneWillResignActive(_ scene: UIScene) {}
    
    func sceneWillEnterForeground(_ scene: UIScene) {}
    
    func sceneDidEnterBackground(_ scene: UIScene) {}
}

