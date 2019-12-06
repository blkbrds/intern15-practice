//
//  BaseTabBarViewController.swift
//  Bai_Tap_14
//
//  Created by ANH NGUYỄN on 12/6/19.
//  Copyright © 2019 asiantech. All rights reserved.
//

import UIKit

class BaseTabBarViewController: UITabBarController {

    static weak var shared: BaseTabBarViewController?

    private var home = UINavigationController(rootViewController: HomeViewController())
    private var favorties = UINavigationController(rootViewController: FavoriteViewController())
    private var map = UINavigationController(rootViewController: MapViewController())
    private var profile = UINavigationController(rootViewController: ProfileViewController())

    enum ScreeType: Int {
        case home
        case map
        case favorites
        case profile

        var tile: String {
            switch self {
            case .home: return "Home"
            case .favorites: return "Favorites"
            case .map: return "Map"
            case .profile: return "Profile"
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        BaseTabBarViewController.shared = self
        cofigViewController()
        configUI()
    }

    private func cofigViewController() {
        home.tabBarItem = UITabBarItem(title: ScreeType.home.tile, image: #imageLiteral(resourceName: "Home"), tag: ScreeType.home.rawValue)
        map.tabBarItem = UITabBarItem(title: ScreeType.favorites.tile, image: #imageLiteral(resourceName: "Map"), tag: ScreeType.favorites.rawValue)
        favorties.tabBarItem = UITabBarItem(title: ScreeType.map.tile, image: #imageLiteral(resourceName: "Favorites"), tag: ScreeType.map.rawValue)
        profile.tabBarItem = UITabBarItem(title: ScreeType.profile.tile, image: #imageLiteral(resourceName: "Profile"), tag: ScreeType.profile.rawValue)
        setViewControllers([home, map, favorties, profile], animated: true)
    }
}
extension BaseTabBarViewController {
    private func configUI() {
        tabBar.tintColor = .black
    }
}
