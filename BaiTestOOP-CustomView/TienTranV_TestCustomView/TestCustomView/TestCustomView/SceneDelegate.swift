//
//  SceneDelegate.swift
//  TestCustomView
//
//  Created by PCI0002 on 1/13/20.
//  Copyright © 2020 TranVanTien. All rights reserved.
//

import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        window = UIWindow(windowScene: windowScene)
        window?.makeKeyAndVisible()

        let viewController = ViewController()
        window?.rootViewController = viewController
    }
}

