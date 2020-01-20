//
//  SceneDelegate.swift
//  baitap11.1
//
//  Created by user on 12/18/19.
//  Copyright © 2019 VienH. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        let navi = UINavigationController(rootViewController: HomeViewController())
        window?.rootViewController = navi
        window?.makeKeyAndVisible()
    }
}
