//
//  BaseTabBarViewController.swift
//  TabBar
//
//  Created by PhuocNguyen on 10/23/19.
//  Copyright © 2019 PhuocNguyen. All rights reserved.
//

import UIKit

class BaseTabBarController: UITabBarController {
    
    static weak var shared: BaseTabBarController?
    
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
        BaseTabBarController.shared = self
        configViewController()
        configUI()
    }
    
    private func configViewController() {
        homeScreen.tabBarItem = UITabBarItem(title: ScreenType.home.title, image: #imageLiteral(resourceName: "ic-home"), tag: ScreenType.home.rawValue)
        mapScreen.tabBarItem = UITabBarItem(title: ScreenType.map.title, image: #imageLiteral(resourceName: "ic-map"), tag: ScreenType.map.rawValue)
        settingScreen.tabBarItem = UITabBarItem(title: ScreenType.setting.title, image: #imageLiteral(resourceName: "ic-setting"), tag: ScreenType.setting.rawValue)
        profileScreen.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 0)
        
        setViewControllers([homeScreen, mapScreen, settingScreen, profileScreen], animated: true)
    }
}

extension BaseTabBarController {
    private func configUI() {
        tabBar.tintColor = .systemBlue
    }
}
