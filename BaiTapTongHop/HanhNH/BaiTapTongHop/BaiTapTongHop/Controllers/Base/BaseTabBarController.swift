//
//  BaseTabBarController.swift
//  BaiTapTongHop
//
//  Created by ANH NGUYỄN on 1/6/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

class BaseTabBarController: UITabBarController {

    enum TabbarType: Int {
        case home
        case map
        case favorite
        case profile

        var title: String {
            switch self {
            case .home:
                return "Home"
            case .map:
                return "Map"
            case .favorite:
                return "Favorite"
            case .profile:
                return "Profile"
            }
        }

        var imageName: String {
            switch self {
            case .home:
                return "ic-tabbar-home"
            case .map:
                return "ic-tabbar-map"
            case .favorite:
                return "ic-tabbar-favorites"
            case .profile:
                return "ic-tabbar-profile"
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configTabBar()
    }
    
    private var homeNavi = UINavigationController(rootViewController: HomeViewController())
    private var mapNaVi = UINavigationController(rootViewController: MapViewController())
    private var favoriteNaVi = UINavigationController(rootViewController: FavoriteViewController())
    private var profileNaVi = UINavigationController(rootViewController: ProfileViewController())

    func configTabBar() {
        homeNavi.tabBarItem = getTabbarItem(for: .home)
        mapNaVi.tabBarItem = getTabbarItem(for: .map)
        favoriteNaVi.tabBarItem = getTabbarItem(for: .favorite)
        profileNaVi.tabBarItem = getTabbarItem(for: .profile)
        
        setViewControllers([homeNavi, mapNaVi, favoriteNaVi, profileNaVi], animated: true)
        tabBar.tintColor = .black
    }
    
    func getTabbarItem(for tabbarType: TabbarType) -> UITabBarItem {
        UITabBarItem(title: tabbarType.title, image: #imageLiteral(resourceName: tabbarType.imageName), tag: tabbarType.rawValue)
    }
}
