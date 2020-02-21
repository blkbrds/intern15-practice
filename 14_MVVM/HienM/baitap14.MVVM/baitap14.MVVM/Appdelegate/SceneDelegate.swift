//
//  SceneDelegate.swift
//  baitap14.MVVM
//
//  Created by Ngoc Hien on 2/18/20.
//  Copyright © 2020 NgocHien. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

	enum TypeScreen {
		case tabbar
	}

	var window: UIWindow?
	static let shared: SceneDelegate = {
		guard let shared = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate else {
			fatalError("Cannot cast `UIApplication.shared.delegate` to `AppDelegate`.")
		}
		return shared
	}()

	private func createTabbar() {
		let tabbarVC = MyTabBarViewController()
		let tabbarNavi = UINavigationController(rootViewController: tabbarVC)

		window?.rootViewController = tabbarNavi
	}
	func changeScreen(type: TypeScreen) {
		switch type {
		case.tabbar:
			createTabbar()
		}
	}


	func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

		guard let windowSence = (scene as? UIWindowScene) else { return }
		let window = UIWindow(windowScene: windowSence)

		self.window = window
		window.makeKeyAndVisible()

		changeScreen(type: .tabbar)
	}
}

extension SceneDelegate {
	func changtabBarController(_ viewController: UIViewController) {
		let navi = UINavigationController(rootViewController: viewController)
		navi.isNavigationBarHidden = true
		window?.rootViewController = navi
	}
}

