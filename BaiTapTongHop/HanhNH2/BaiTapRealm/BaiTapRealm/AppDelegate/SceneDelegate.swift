//
//  SceneDelegate.swift
//  BaiTapRealm
//
//  Created by ANH NGUYỄN on 1/22/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        self.window = window
        window.makeKeyAndVisible()
        setRootTabbar()
    }
}
extension SceneDelegate {
    private func setRootTabbar() {
        let tabbarVC = BaseTabBarController()
        window?.rootViewController = tabbarVC
    }
}

