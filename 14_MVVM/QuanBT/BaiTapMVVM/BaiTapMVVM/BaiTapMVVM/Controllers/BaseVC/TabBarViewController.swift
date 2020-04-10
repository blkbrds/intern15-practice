//
//  TabBarViewController.swift
//  BaiTapMVVM
//
//  Created by Sếp Quân on 4/8/20.
//  Copyright © 2020 QuanBT. All rights reserved.
//

import UIKit

final class BaseTabBarViewController: UITabBarController {
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Function
    private func setupUI() {
        //Home
        let homeVC = HomeViewController()
        let homeNavi = UINavigationController(rootViewController: homeVC)
        homeVC.tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "home"), tag: 0)
        
        //Map
        let mapVC = MapViewController()
        let mapNavi = UINavigationController(rootViewController: mapVC)
        mapVC.tabBarItem = UITabBarItem(title: "Map", image: UIImage(named: "map"), tag: 1)
        
        //Favorites
        let favoritesVC = FavoritesViewController()
        let favoritesNavi = UINavigationController(rootViewController: favoritesVC)
        favoritesVC.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 2)
        
        //Profile
        let profileVC = ProfileViewController()
        let profileNavi = UINavigationController(rootViewController: profileVC)
        profileVC.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(named: "profile"), tag: 3)
        
        //tabbar controller
        self.viewControllers = [homeNavi, mapNavi, favoritesNavi, profileNavi]
        self.selectedIndex = 0
        self.tabBar.tintColor = .red
        self.tabBar.unselectedItemTintColor = .black
    }
}
