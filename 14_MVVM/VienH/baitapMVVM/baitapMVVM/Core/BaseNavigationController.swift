//
//  BaseNavigationController.swift
//  baitapMVVM
//
//  Created by user on 1/21/20.
//  Copyright © 2020 VienH. All rights reserved.
//

import UIKit

class BaseNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationBar.barTintColor = UIColor(red: 95.0 / 255.0, green: 75.0 / 255.0, blue: 139.0 / 255.0, alpha: 1.0)
        self.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        self.navigationBar.tintColor = UIColor.white
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
