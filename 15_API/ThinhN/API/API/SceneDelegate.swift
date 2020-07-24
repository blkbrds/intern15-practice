//
//  SceneDelegate.swift
//  API
//
//  Created by PCI0019 on 7/24/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        let viewController = BaseViewController()

        window.rootViewController = viewController.createTabbar()
        self.window = window
        window.makeKeyAndVisible()
    }
    
}
