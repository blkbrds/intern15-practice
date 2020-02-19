//
//  BaseTabbarController.swift
//  baitap13
//
//  Created by user on 1/20/20.
//  Copyright © 2020 VienH. All rights reserved.
//

import UIKit

class BaseTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configTabbar()
    }
    func configTabbar() {
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.red], for: .selected)
        UITabBar.appearance().barTintColor = UIColor.white
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
