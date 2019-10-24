//
//  BaseTabBarViewController.swift
//  TabBar
//
//  Created by PhuocNguyen on 10/23/19.
//  Copyright © 2019 PhuocNguyen. All rights reserved.
//

import UIKit

class BaseTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }
    
    func setupTabBar() {
        tabBarController?.tabBar.tintColor = UIColor(displayP3Red: 33/255, green: 177/255, blue: 243/255, alpha: 1)
    }
}
