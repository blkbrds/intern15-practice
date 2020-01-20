//
//  BaseNavigationViewController.swift
//  abc
//
//  Created by PhuocNguyen on 10/23/19.
//  Copyright © 2019 PhuocNguyen. All rights reserved.
//

import UIKit
import GoogleAPIClientForREST
import GoogleSignIn

class BaseNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        config()
    }
    
    private func config() {
        navigationBar.tintColor = App.Color.mainColor
        navigationBar.barTintColor = App.Color.backgroudColor
        navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: App.Color.mainColor,
                                                                   NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 22)]
    }
}