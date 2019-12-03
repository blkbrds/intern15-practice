//
//  SceneDelegate.swift
//  BaiTap13
//
//  Created by ANH NGUYỄN on 12/3/19.
//  Copyright © 2019 asiantech. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate, UIApplicationDelegate {

    enum AppStatus {
        case login
        case logOut
    }

    static var shared: SceneDelegate {
        guard let scene = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate else {
            fatalError("Can not")
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
        let tabBarController = BaseTabBarViewController()
        window?.rootViewController = tabBarController
    }
}

