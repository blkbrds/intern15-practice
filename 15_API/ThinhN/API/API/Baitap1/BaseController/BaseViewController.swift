//
//  BaseViewController.swift
//  API
//
//  Created by PCI0019 on 7/24/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createTabbar()
        setupUI()
    }
    
    func createTabbar() -> UITabBarController {
        let featuredVC = HomeViewController()
        let featuredNavi = UINavigationController(rootViewController: featuredVC)
        featuredNavi.tabBarItem = UITabBarItem(title: "feature", image: UIImage(systemName: "star"), selectedImage: UIImage(systemName: "star.fill"))
        
        let messagesVC = MessagesViewController()
        let messagesNavi = UINavigationController(rootViewController: messagesVC)
        messagesNavi.tabBarItem = UITabBarItem(title: "messages", image: UIImage(systemName: "square"), selectedImage: UIImage(systemName: "square.fill"))
        
        let profileVC = ProfileViewController()
        let profileNavi = UINavigationController(rootViewController: profileVC)
        profileNavi.tabBarItem = UITabBarItem(title: "profile", image: UIImage(systemName: "circle"), selectedImage: UIImage(systemName: "circle.fill"))
        
        let tabbarViewController = UITabBarController()
        tabbarViewController.viewControllers = [featuredNavi, messagesNavi, profileNavi]
        return tabbarViewController
    }
    func setupUI() {
        
    }
    
    func setupData() {
        
    }
}
