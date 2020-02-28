//
//  TabBarViewController.swift
//  MVVM
//
//  Created by Ngoc Hien on 2/20/20.
//  Copyright © 2020 NgocHien. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
       setupTabBar()
    }
	private func setupTabBar() { 
		let homeVC = HomeViewController()
		let homeNavi = UINavigationController(rootViewController: homeVC)
		let mapVC = MapViewController()
		let mapNavi = UINavigationController(rootViewController: mapVC)
		let profileVC = ProfileViewController()
		let profileNavi = UINavigationController(rootViewController: profileVC)
		let favoriteVC = ProfileViewController()
		let favoriteNavi = UINavigationController(rootViewController: favoriteVC)
		
		homeVC.tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "home"), tag: 0)
		mapVC.tabBarItem = UITabBarItem(title: "Map", image: UIImage(named: "map"), tag: 1)
		profileVC.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(named: "user"), tag: 2)
		favoriteVC.tabBarItem = UITabBarItem(title: "Favorite", image: UIImage(named: "heart"), tag: 3)
		
		self.viewControllers = [homeNavi, mapNavi, profileNavi, favoriteNavi]
		self.selectedIndex = 0
		self.tabBar.unselectedItemTintColor = .black
		self.tabBar.tintColor =	.systemBlue
		
		let appearance = UITabBarItem.appearance()
		appearance.setBadgeTextAttributes([NSAttributedString.Key.strokeColor: UIColor.systemPink], for: .normal)
		appearance.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15)], for: .normal)
		
	}


}
