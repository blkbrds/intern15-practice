//
//  SceneDelegate.swift
//  baitap01.TabbarController
//
//  Created by Ngoc Hien on 2/13/20.
//  Copyright © 2020 NgocHien. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

	var window: UIWindow?
	static let shared: SceneDelegate = {
		guard let shared = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate else {
			fatalError("Cannot cast `UIApplication.shared.delegate` to `AppDelegate`.")
		}
		return shared
	}()


	func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

		guard let windowSence = (scene as? UIWindowScene) else { return }
		let window = UIWindow(windowScene: windowSence)
		let loginVC = LoginViewController()
		let loginNavi = UINavigationController(rootViewController: loginVC)

		window.rootViewController = loginNavi
		self.window = window
		window.makeKeyAndVisible()
	}
}

extension SceneDelegate {
	func changtabBarController(_ viewController: UIViewController) {
		let navi = UINavigationController(rootViewController: viewController)
		navi.isNavigationBarHidden = true
		window?.rootViewController = navi
	}
}

