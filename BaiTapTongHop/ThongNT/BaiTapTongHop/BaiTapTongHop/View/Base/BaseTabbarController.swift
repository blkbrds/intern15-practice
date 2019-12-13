//
//  BaseTabbarController.swift
//  BaiTapTongHop
//
//  Created by PCI0018 on 11/22/19.
//  Copyright © 2019 Asian Tech. All rights reserved.
//

import UIKit

class BaseTabbarController: UITabBarController {

    static weak var shared: BaseTabbarController?

    private var homeNavigationController = UINavigationController(rootViewController: HomeViewController())
    private var mapNavigationController = UINavigationController(rootViewController: MapViewController())

    enum Screen: Int {
        case home
        case map
        case favorites
        case profile

        var title: String {
            switch self {
            case .home:
                return "Home"
            case .map:
                return "Map"
            case .favorites:
                return "Favorites"
            case .profile:
                return "Profile"
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        BaseTabbarController.shared = self
        configUI()
        configViewController()
    }

    private func configUI() {
        tabBar.tintColor = .systemBlue
    }

    private func configViewController() {
        homeNavigationController.tabBarItem = UITabBarItem(title: "Home", image: #imageLiteral(resourceName: "tabbar_icon_home_png.png"), selectedImage: #imageLiteral(resourceName: "tabbar_icon_home_selected_png.png"))
        mapNavigationController.tabBarItem = UITabBarItem(title: "Map", image: #imageLiteral(resourceName: "tabbar_icon_map_png.png"), selectedImage: #imageLiteral(resourceName: "tabbar_icon_map_selected_png.png"))
        setViewControllers([homeNavigationController, mapNavigationController], animated: true)
    }
}
