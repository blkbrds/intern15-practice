//
//  SceneDelegate.swift
//  baitap4.6+4.7
//
//  Created by user on 11/20/19.
//  Copyright © 2019 VienH. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
              let window = UIWindow(windowScene: windowScene)
        //        let navigation = UINavigationController(rootViewController: Ex05ViewController())
              window.rootViewController = MonkeyViewController()
              self.window = window
              window.makeKeyAndVisible()
        guard let _ = (scene as? UIWindowScene) else { return }
    }
}