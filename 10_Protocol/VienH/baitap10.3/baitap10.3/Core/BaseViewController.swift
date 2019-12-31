//
//  BaseViewController.swift
//  baitap10.3
//
//  Created by user on 12/16/19.
//  Copyright © 2019 VienH. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupData()
        setupUI()
    }

    // MARK : setup Data & UI
    func setupData() {
    }

    func setupUI() {
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: nil, action: nil)
    }

    func updateUI() { }
}
