//
//  SceneDelegate.swift
//  SliderViewWithXib
//
//  Created by PCI0019 on 6/2/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        window?.makeKeyAndVisible()
        let viewController = SliderViewController()
        window?.rootViewController = viewController
}
