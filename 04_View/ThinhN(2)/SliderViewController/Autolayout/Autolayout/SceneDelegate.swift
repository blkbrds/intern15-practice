//
//  SceneDelegate.swift
//  Autolayout
//
//  Created by PCI0019 on 6/3/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowSence = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowSence)
        let viewController = ScrollViewController()
        let navigationController = UINavigationController(rootViewController: viewController)
        window.rootViewController = navigationController
        self.window = window
        window.makeKeyAndVisible()
    }
}
