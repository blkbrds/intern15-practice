//
//  BaseTabbarController.swift
//  MVVM
//
//  Created by user on 1/22/20.
//  Copyright © 2020 VienH. All rights reserved.
//

import UIKit

final class BaseTabbarController: UITabBarController {

    enum ScreenType: Int {
        case home
        case favorites
        case profiles
        case friends

        var title: String {
            switch self {
            case .home:
                return "Home"
            case .favorites:
                return "Favorites"
            case .profiles:
                return "Profiles"
            default:
                return "Friends"
            }
        }
    }

    static weak var shared: BaseTabbarController?

    private var homeScreen = UINavigationController(rootViewController: HomeViewController())
    private var favoritesScreen = UINavigationController(rootViewController: FavoritesViewController())
    private var profilesScreen = UINavigationController(rootViewController: ProfilesViewController())
    private var friendsScreen = UINavigationController(rootViewController: FriendsViewController())

    override func viewDidLoad() {
        super.viewDidLoad()
        BaseTabbarController.shared = self
        configViewController()
        configUI()
    }

    private func configViewController() {
        homeScreen.tabBarItem = UITabBarItem(title: ScreenType.home.title, image: #imageLiteral(resourceName: "icons8-home-page-30"), tag: ScreenType.home.rawValue)
        friendsScreen.tabBarItem = UITabBarItem(title: ScreenType.friends.title, image: #imageLiteral(resourceName: "icons8-add-user-group-man-man-30"), tag: ScreenType.favorites.rawValue)
        favoritesScreen.tabBarItem = UITabBarItem(title: ScreenType.favorites.title, image: #imageLiteral(resourceName: "icons8-heart-outline-30"), tag: ScreenType.favorites.rawValue)
        profilesScreen.tabBarItem = UITabBarItem(title: ScreenType.profiles.title, image: #imageLiteral(resourceName: "icons8-user-male-30"), tag: ScreenType.profiles.rawValue)
        setViewControllers([homeScreen, friendsScreen, favoritesScreen, profilesScreen], animated: true)
    }

    private func configUI() {
        tabBar.tintColor = .red
    }
}

