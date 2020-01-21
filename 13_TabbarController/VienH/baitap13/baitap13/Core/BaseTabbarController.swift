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
        self.tabBar.tintColor = UIColor(red: 95.0/255.0, green: 75.0/255.0, blue: 139.0/255.0, alpha: 1.0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
