//
//  SceneDelegate.swift
//  Baitap3+4
//
//  Created by ADMIN on 8/12/2563 BE.
//  Copyright © 2563 BE asiantech. All rights reserved.
//

import UIKit
import SwiftUI

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

   var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        let vc = HomeViewController()
        let navi = UINavigationController(rootViewController: vc)
        window.rootViewController = navi
        self.window = window
        window.makeKeyAndVisible()
    }
}
