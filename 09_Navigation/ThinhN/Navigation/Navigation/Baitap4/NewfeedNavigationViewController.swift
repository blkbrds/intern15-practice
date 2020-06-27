//
//  NewfeedNavigationViewController.swift
//  Navigation
//
//  Created by ADMIN on 6/22/2563 BE.
//  Copyright © 2563 BE asiantech. All rights reserved.
//

import UIKit

class NewfeedNavigationViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "New Feed"
        setupView()
    }
    func setupView() {
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        let search = UIBarButtonItem(barButtonSystemItem: .search, target: nil, action: nil)
        navigationItem.leftBarButtonItem = search
        navigationController?.navigationBar.barTintColor = UIColor.systemBlue
        let settingButton = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: nil)
        navigationItem.rightBarButtonItem = settingButton
    }
}
