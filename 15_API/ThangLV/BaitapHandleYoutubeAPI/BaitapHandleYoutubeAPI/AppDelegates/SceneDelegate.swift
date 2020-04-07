//
//  SceneDelegate.swift
//  BaitapHandleYoutubeAPI
//
//  Created by PCI0008 on 2/12/20.
//  Copyright © 2020 PCI0008. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        window = UIWindow(windowScene: windowScene)
        window?.makeKeyAndVisible()
        
        let homeViewController = HomeViewController()
        window?.rootViewController = UINavigationController(rootViewController: homeViewController)
    }
}
