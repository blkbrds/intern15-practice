//
//  MyTabBarViewController.swift
//  BaiTap01
//
//  Created by An Nguyễn on 1/5/20.
//  Copyright © 2020 An Nguyễn. All rights reserved.
//

import UIKit

class MyTabBarController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
        navigationItem.leftBarButtonItem = UIBarButtonItem()
    }

    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        title = viewController.title
        print(title ?? "null")
    }

    private func setupTabBar() {
        let homeVC = HomeViewController()
        let mapVC = MapViewController()
        let favoritesVC = FavoritesViewController()
        let profileVC = ProfileViewController()
        homeVC.tabBarItem = UITabBarItem.init(title: "Home", image: UIImage.init(systemName: "house"), tag: 0)
        mapVC.tabBarItem = UITabBarItem.init(title: "Map", image: UIImage.init(systemName: "map"), tag: 1)
        favoritesVC.tabBarItem = UITabBarItem.init(title: "Favorites", image: UIImage.init(systemName: "star"), tag: 2)
        favoritesVC.tabBarItem.badgeValue = "10"
        favoritesVC.tabBarItem.badgeColor = .blue
        profileVC.tabBarItem = UITabBarItem.init(title: "Profile", image: UIImage.init(systemName: "person.fill"), tag: 3)
        self.viewControllers = [homeVC, mapVC, profileVC, favoritesVC]
        self.selectedIndex = 0
        self.title = viewControllers?[self.selectedIndex].title
        self.delegate = self
        self.tabBar.backgroundImage = UIImage(named: "photo")
        self.tabBar.tintColor = .yellow
        self.tabBar.unselectedItemTintColor = .red
        tabBarItem.imageInsets = UIEdgeInsets(top: 50, left: 0, bottom: 100, right: 0)
        let appearance = UITabBarItem.appearance()
        appearance.setBadgeTextAttributes([NSAttributedString.Key.strokeColor: UIColor.systemPink], for: .normal)
        appearance.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15)], for: .normal)
    }
}

