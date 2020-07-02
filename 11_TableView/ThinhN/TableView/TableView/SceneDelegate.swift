//
//  SceneDelegate.swift
//  TableView
//
//  Created by PCI0019 on 6/29/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        let viewController = ActionCellViewController()
        let navi = UINavigationController(rootViewController: viewController)
        window.rootViewController = navi
        self.window = window
        window.makeKeyAndVisible()
    }
}
