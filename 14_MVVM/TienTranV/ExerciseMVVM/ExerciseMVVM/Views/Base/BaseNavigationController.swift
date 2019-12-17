//
//  BaseNavigationController.swift
//  BaiTap02
//
//  Created by PCI0002 on 11/27/19.
//  Copyright © 2019 TranVanTien. All rights reserved.
//

import UIKit

class BaseTabBarController: UITabBarController {
    
    enum ScreenType: Int {
        case home = 0
        case map
        case favorites
        case profile

        var title: String {
            switch self {
            case .home: return "Home"
            case .map: return "Map"
            case .favorites: return "Favorites"
            case .profile: return "Profile"
            }
        }
    }

    static weak var shared: BaseTabBarController?

    private var homeScreen = UINavigationController(rootViewController: HomeViewController())
    private var mapScreen = UINavigationController(rootViewController: MapViewController())
    private var favoritesScreen = UINavigationController(rootViewController: FavoritesViewController())
    private var profileScreen = UINavigationController(rootViewController: ProfileViewController())

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        BaseTabBarController.shared = self
        configViewController()
        configUI()
    }

    // MARK: - Private funcs
    private func configViewController() {
        homeScreen.tabBarItem = UITabBarItem(title: ScreenType.home.title, image: #imageLiteral(resourceName: "ic-home"), tag: ScreenType.home.rawValue)
        mapScreen.tabBarItem = UITabBarItem(title: ScreenType.map.title, image: #imageLiteral(resourceName: "ic-map"), tag: ScreenType.map.rawValue)
        favoritesScreen.tabBarItem = UITabBarItem(title: ScreenType.favorites.title, image: #imageLiteral(resourceName: "ic-favorites"), tag: ScreenType.favorites.rawValue)
        profileScreen.tabBarItem = UITabBarItem(title: ScreenType.profile.title, image: #imageLiteral(resourceName: "ic-profile"), tag: ScreenType.profile.rawValue)

        setViewControllers([homeScreen, mapScreen, favoritesScreen, profileScreen], animated: true)
    }

    private func configUI() {
        tabBar.tintColor = .black
    }
}

