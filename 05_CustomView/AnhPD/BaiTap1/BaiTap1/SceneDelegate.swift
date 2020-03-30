//
//  SceneDelegate.swift
//  BaiTap1
//
//  Created by PCI0012 on 3/30/20.
//  Copyright © 2020 PCI0012. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        window?.makeKeyAndVisible()
        let viewController = ViewController()
        window?.rootViewController = viewController
    }
}

