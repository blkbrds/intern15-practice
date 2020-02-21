//
//  BaseViewController.swift
//  BaiTap01
//
//  Created by An Nguyễn on 1/5/20.
//  Copyright © 2020 An Nguyễn. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    func setupUI() {
        setupTabBar()
    }

    func setupTabBar() {
        self.tabBarItem.badgeColor = .blue
    }
}
