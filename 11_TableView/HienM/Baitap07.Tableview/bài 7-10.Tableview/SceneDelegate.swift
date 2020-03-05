//
//  SceneDelegate.swift
//  bài 7-10.Tableview
//
//  Created by Ngoc Hien on 2/7/20.
//  Copyright © 2020 NgocHien. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

	var window: UIWindow?

	func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

		guard let windowSence = (scene as? UIWindowScene) else { return }
		let window = UIWindow(windowScene: windowSence)
		let vc = HomeViewController()
		let navi = UINavigationController(rootViewController: vc)
		window.rootViewController = navi
		self.window = window
		window.makeKeyAndVisible()
	}
}

