//
//  SceneDelegate.swift
//  baitap11
//
//  Created by user on 12/24/19.
//  Copyright © 2019 VienH. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        let navi = UINavigationController(rootViewController: ExerciseElevenViewController())
        window?.rootViewController = navi
        window?.makeKeyAndVisible()
    }
}
