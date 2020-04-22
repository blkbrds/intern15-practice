//
//  BaseTabBarViewController.swift
//  DemoConnectNetworking
//
//  Created by PCI0002 on 4/20/20.
//  Copyright © 2020 LeThanhLam. All rights reserved.
//

import UIKit

class BaseTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        let homeVC = HomeViewController()
        let homeNavi = UINavigationController(rootViewController: homeVC)
        homeVC.tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "home"), tag: 0)
        
        let messageVC = MessagesViewController()
        let messageNavi = UINavigationController(rootViewController: messageVC)
        messageVC.tabBarItem = UITabBarItem(title: "Message", image: UIImage(named: "message"), tag: 1)
        
        let socialVC = SocialViewController()
        let socialNavi = UINavigationController(rootViewController: socialVC)
        socialVC.tabBarItem = UITabBarItem(title: "Community", image: UIImage(named: "community"), tag: 2)
        
        let profileVC = ProfileViewController()
        let profileNavi = UINavigationController(rootViewController: profileVC)
        profileVC.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(named: "user"), tag: 3)
        
        self.viewControllers = [homeNavi, messageNavi, socialNavi, profileNavi]
        self.selectedIndex = 0
        self.tabBar.tintColor = .blue
    }
}
