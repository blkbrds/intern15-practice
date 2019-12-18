//
//  SceneDelegate.swift
//  NoStoryboard
//
//  Created by Ngoc Hien on 12/18/19.
//  Copyright © 2019 NgocHien. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

	var window: UIWindow?
	func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = myViewController()
        self.window = window
        window.makeKeyAndVisible()
        
    }


}
