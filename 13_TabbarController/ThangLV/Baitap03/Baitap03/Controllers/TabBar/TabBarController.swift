//
//  TabBarController.swift
//  Baitap03
//
//  Created by PCI0008 on 1/20/20.
//  Copyright © 2020 PCI0008. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        configTabBar()
    }

    func configTabBar() {
        let homeViewController = HomeViewController()
        let homeNavigationController = UINavigationController(rootViewController: homeViewController)
        homeNavigationController.tabBarItem = UITabBarItem(tabBarSystemItem: .recents, tag: 0)

        let mapViewController = MapViewController()
        let mapNavigationController = UINavigationController(rootViewController: mapViewController)
        mapViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 1)

        let favoritesViewController = FavoritesViewController()
        let favoritesNavigationController = UINavigationController(rootViewController: favoritesViewController)
        favoritesViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 2)

        let profileViewController = ProfileViewController()
        profileViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 3)

        self.viewControllers = [homeNavigationController, mapNavigationController, favoritesNavigationController, profileViewController]
    }
}
