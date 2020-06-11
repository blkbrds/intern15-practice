//
//  SceneDelegate.swift
//  baiTapCustomView
//
//  Created by ADMIN on 3/25/2563 BE.
//  Copyright © 2563 BE asiantech. All rights reserved.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    
      guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        window?.makeKeyAndVisible()
        //let viewController = MyAvatarViewController()
        //let viewController = MySliderViewController()
        //let viewController = BadgeNumberViewController()
        //let viewController = MyAvatarViewController()
        let viewController = DatePickerViewController()
        window?.rootViewController = viewController
    }

   
}
