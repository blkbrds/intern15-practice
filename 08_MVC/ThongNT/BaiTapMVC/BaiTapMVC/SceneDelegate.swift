//
//  SceneDelegate.swift
//  BaiTapMVC
//
//  Created by PCI0018 on 10/28/19.
//  Copyright © 2019 Asian Tech. All rights reserved.
//

import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = CalculatorViewController()
        self.window = window
        window.makeKeyAndVisible()
    }
}

