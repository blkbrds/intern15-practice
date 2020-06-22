//
//  ColorNavigationViewController.swift
//  Navigation
//
//  Created by ADMIN on 6/22/2563 BE.
//  Copyright © 2563 BE asiantech. All rights reserved.
//

import UIKit

class ColorNavigationViewController: UIViewController {
    
        override func viewDidLoad() {
        super.viewDidLoad()
        title = "Gradient NavigationBar"
        setupView()
    }
    func setupView() {
        navigationController?.navigationBar.barTintColor = UIColor.green
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.setBackgroundImage(UIImage(named: "gradient"), for: .default)
    }
}
