//
//  SceneDelegate.swift
//  Tabbar
//
//  Created by PCI0018 on 11/20/19.
//  Copyright © 2019 Asian Tech. All rights reserved.
//

import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    enum ApplicationStatus {
        case didLogin
        case willLogin
    }

    static var shared: SceneDelegate {
        guard let scene = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate else { fatalError("Can not find SceneDelegate") }
        return scene
    }

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        self.window = window
        if UserDefaults.standard.value(forKey: "LoginStatus") != nil {
            configRootView(with: .didLogin)
        } else {
            configRootView(with: .willLogin)
        }
        window.makeKeyAndVisible()
    }

    func configRootView(with status: ApplicationStatus) {
        switch status {
        case .didLogin:
            didLogin()
        case .willLogin:
            willLogin()
        }
    }

    func didLogin() {
        let tabBarController = BaseTabbarController()
        window?.rootViewController = tabBarController
    }

    func willLogin() {
        let loginVC = LoginViewController()
        let loginNavigationcontroller = UINavigationController(rootViewController: loginVC)
        window?.rootViewController = loginNavigationcontroller
    }
}
