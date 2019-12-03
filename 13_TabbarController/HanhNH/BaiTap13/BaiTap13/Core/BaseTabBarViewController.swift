//
//  BaseTabBarViewController.swift
//  BaiTap13
//
//  Created by ANH NGUYỄN on 12/3/19.
//  Copyright © 2019 asiantech. All rights reserved.
//

import UIKit

class BaseTabBarViewController: UITabBarController {

    static weak var shared: BaseTabBarViewController?

    private var homeScreen = UINavigationController(rootViewController: HomeViewController())
    private var mapScreen = UINavigationController(rootViewController: MapViewController())
    private var settingScreen = UINavigationController(rootViewController: SettingViewController())
    private var profileScreen = UINavigationController(rootViewController: ProfileViewController())

    enum ScreenType: Int {
        case home = 0
        case map
        case setting
        case profile

        var title: String {
            switch self {
            case .home: return "Home"
            case .map: return "Map"
            case .profile: return "Profile"
            case .setting: return "Setting"
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        BaseTabBarViewController.shared = self
        configViewController()
        configUI()
    }

    private func configViewController() {
        homeScreen.tabBarItem = UITabBarItem(title: ScreenType.home.title, image: #imageLiteral(resourceName: "home"), tag: ScreenType.home.rawValue)
        homeScreen.tabBarItem.badgeValue = "15"
        homeScreen.tabBarItem.badgeColor = .blue
        mapScreen.tabBarItem = UITabBarItem(title: ScreenType.map.title, image: #imageLiteral(resourceName: "map"), tag: ScreenType.map.rawValue)
        settingScreen.tabBarItem = UITabBarItem(title: ScreenType.setting.title, image: #imageLiteral(resourceName: "setting"), tag: ScreenType.setting.rawValue)
        profileScreen.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 0)

        setViewControllers([homeScreen, mapScreen, settingScreen, profileScreen], animated: true)
    }
}

extension BaseTabBarViewController {
    private func configUI() {
        tabBar.tintColor = .systemBlue
    }
}
