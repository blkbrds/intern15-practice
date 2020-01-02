//
//  BaseTabBarController.swift
//  BaiTapTongHop
//
//  Created by PCI0002 on 12/30/19.
//  Copyright © 2019 TranVanTien. All rights reserved.
//

import UIKit

final class BaseTabBarController: UITabBarController {
    enum ScreenType: Int {
        case home = 0
        case headlines
        case following
        case setting

        var title: String {
            switch self {
            case .home: return "For you"
            case .headlines: return "Headlines"
            case .following: return "Following"
            case .setting: return "Setting"
            }
        }
    }

    static weak var shared: BaseTabBarController?

    private var homeScreen = UINavigationController(rootViewController: TestHomeViewController())
    private var headlinesScreen = UINavigationController(rootViewController: HomeViewController())
    private var followingScreen = UINavigationController(rootViewController: FollowingViewController())
    private var settingScreen = UINavigationController(rootViewController: SettingViewController())

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        BaseTabBarController.shared = self
        configViewController()
        configUI()
    }

    // MARK: - Private funcs
    private func configViewController() {
        homeScreen.tabBarItem = UITabBarItem(title: ScreenType.home.title, image: #imageLiteral(resourceName: "ic-foryou"), tag: ScreenType.home.rawValue)
        followingScreen.tabBarItem = UITabBarItem(title: ScreenType.following.title, image: #imageLiteral(resourceName: "ic-following"), tag: ScreenType.following.rawValue)
        settingScreen.tabBarItem = UITabBarItem(title: ScreenType.setting.title, image: #imageLiteral(resourceName: "ic-setting"), tag: ScreenType.setting.rawValue)
        headlinesScreen.tabBarItem = UITabBarItem(title: ScreenType.headlines.title, image: #imageLiteral(resourceName: "ic-headlines"), tag: ScreenType.setting.rawValue)

//        var viewControllers: [UIViewController]?
//        viewControllers?.append(homeScreen)
//        viewControllers?.append(headlinesScreen)
//        viewControllers?.append(followingScreen)
//        viewControllers?.append(settingScreen)

        setViewControllers([headlinesScreen, homeScreen, followingScreen, settingScreen], animated: true)
    }

    private func configUI() {
        tabBar.tintColor = .black
    }
}
