//
//  SceneDelegate.swift
//  ExerciseTabbarController
//
//  Created by PCI0002 on 12/11/19.
//  Copyright © 2019 TranVanTien. All rights reserved.
//

import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    // MARK: - Enum
    enum AppStatus {
        case login
        case logout
    }
    
    // MARK: - Singleton
    private static let sharedSceneDelegate: SceneDelegate = {
        print("test singleton")
        guard let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate else { fatalError("Can not find SceneDelegate") }
        return sceneDelegate
    }()

    class func shared() -> SceneDelegate {
        return sharedSceneDelegate
    }

    private override init() {
        super.init()
    }
    
    // MARK: - Properties
    var window: UIWindow?

    // MARK: - Public funcs
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        print("A")
        if UserDefaults.standard.value(forKey: "Is Login") == nil {
            configRootView(with: .logout)
        } else {
            configRootView(with: .login)
        }

        window?.makeKeyAndVisible()
    }
    
    func configRootView(with status: AppStatus) {
        switch status {
        case .login:
            login()
        case .logout:
            logout()
        }
    }
    
    // MARK: - Private funcs
    private func logout() {
        let loginVC = LoginViewController()
        let loginNavi = UINavigationController(rootViewController: loginVC)
        window?.rootViewController = loginNavi
    }
    
    private func login() {
        let tabBarController = BaseTabBarController()
        window?.rootViewController = tabBarController
    }
}

