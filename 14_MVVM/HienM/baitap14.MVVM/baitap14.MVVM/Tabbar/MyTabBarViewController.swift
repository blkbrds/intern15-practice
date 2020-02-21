//
//  MyTabBarViewController.swift
//  baitap14.MVVM
//
//  Created by Ngoc Hien on 2/19/20.
//  Copyright © 2020 NgocHien. All rights reserved.
//

import UIKit

class MyTabBarViewController: UITabBarController, UITabBarControllerDelegate {

	override func viewDidLoad() {
		super.viewDidLoad()
		setupTabbar()


	}
	func setupTabbar() {
		let homeVC = HomeViewController()
		let mapVC = MapViewController()
		let profileVC = ProfileViewController()
		let favoriteVC = FavoriteViewController()

		homeVC.tabBarItem = UITabBarItem(title: "Home", image: #imageLiteral(resourceName: "home"), tag: 0)
		mapVC.tabBarItem = UITabBarItem(title: "Map", image: #imageLiteral(resourceName: "map"), tag: 1)
		profileVC.tabBarItem = UITabBarItem(title: "Profile", image: #imageLiteral(resourceName: "user"), tag: 2)
		favoriteVC.tabBarItem = UITabBarItem(title: "Favorite", image: #imageLiteral(resourceName: "heart"), tag: 3)

		self.viewControllers = [homeVC, mapVC, profileVC, favoriteVC]
		self.selectedIndex = 0
		self.tabBar.backgroundImage = UIImage(named: "galaxy5")
		self.tabBar.tintColor = .blue
		self.tabBar.unselectedItemTintColor = .black
		let appearance = UITabBarItem.appearance()
		appearance.setBadgeTextAttributes([NSAttributedString.Key.strokeColor: UIColor.systemPink], for: .normal)
		appearance.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15)], for: .normal)
	}
}
