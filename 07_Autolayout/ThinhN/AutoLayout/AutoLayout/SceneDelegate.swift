//
//  SceneDelegate.swift
//  AutoLayout
//
//  Created by ADMIN on 4/5/2563 BE.
//  Copyright © 2563 BE asiantech. All rights reserved.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return}
        let window = UIWindow(windowScene: windowScene)
        let viewController = Bai9ViewController()
        self.window = window
        window.rootViewController = viewController
        window.makeKeyAndVisible()
    }
}
