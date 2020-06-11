//
//  BaseTabbarController.swift
//  API_MVVM_2
//
//  Created by PCI0002 on 5/28/20.
//  Copyright © 2020 LeThanhLam. All rights reserved.
//

import Foundation
import UIKit

final class BaseTabBarViewController: UITabBarController {

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    // MARK: - Private Function
    private func setupUI() {
        let homeVC = HomeViewController()
        let homeNavi = UINavigationController(rootViewController: homeVC)
        homeVC.tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "home"), tag: 0)

        let searchVC = SearchViewController()
        let mapNavi = UINavigationController(rootViewController: searchVC)
        searchVC.tabBarItem = UITabBarItem(title: "Search", image: UIImage(named: "search"), tag: 1)
        
        
        let favoritesVC = FavoritesPageViewController()
        let favoritesNavi = UINavigationController(rootViewController: favoritesVC)
        favoritesVC.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 2)

        

//        let favoritesVC = FavoritesViewController()
//        let favoritesNavi = UINavigationController(rootViewController: favoritesVC)
//        favoritesVC.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 2)

//        let gitFavoritesVC = GitFavoritesViewController()
//        let gitFavoritesNavi = UINavigationController(rootViewController: gitFavoritesVC)
//        gitFavoritesVC.tabBarItem = UITabBarItem(title: "Git Favorites", image: UIImage(named: "star1"), tag: 3)

//        self.viewControllers = [homeNavi, mapNavi, favoritesNavi, gitFavoritesNavi]
        self.viewControllers = [homeNavi, mapNavi, favoritesNavi]
        self.selectedIndex = 0
        self.tabBar.tintColor = .red
        self.tabBar.unselectedItemTintColor = .blue
    }
}
