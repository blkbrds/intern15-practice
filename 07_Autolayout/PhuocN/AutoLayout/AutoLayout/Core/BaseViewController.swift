//
//  BaseViewController.swift
//  AutoLayout
//
//  Created by PhuocNguyen on 10/9/19.
//  Copyright © 2019 PhuocNguyen. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupData()
    }
    
    // MARK: setup Data & UI
    func setupUI() {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: nil, action: nil)
    }
    
    func setupData() {}
}
