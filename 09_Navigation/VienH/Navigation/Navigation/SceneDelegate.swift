//
//  SceneDelegate.swift
//  Navigation
//
//  Created by user on 12/9/19.
//  Copyright © 2019 VienH. All rights reserved.
//

import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        let viewController = ListProfileViewController()
        let nav = UINavigationController(rootViewController: viewController)
        window?.rootViewController = nav
        window?.makeKeyAndVisible()
    }
}

