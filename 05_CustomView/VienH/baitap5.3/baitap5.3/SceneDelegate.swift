//
//  SceneDelegate.swift
//  baitap5.3
//
//  Created by user on 11/21/19.
//  Copyright © 2019 VienH. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = BadgeViewController()
        self.window = window
        window.makeKeyAndVisible()
    }
}
