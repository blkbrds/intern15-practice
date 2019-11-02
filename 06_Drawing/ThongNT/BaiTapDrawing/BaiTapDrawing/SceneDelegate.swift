//
//  SceneDelegate.swift
//  BaiTapDrawing
//
//  Created by PCI0018 on 10/21/19.
//  Copyright © 2019 Asian Tech. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = MyViewController()
        self.window = window
        window.makeKeyAndVisible()
    }
}

