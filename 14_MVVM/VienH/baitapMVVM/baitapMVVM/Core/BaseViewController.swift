//
//  BaseViewController.swift
//  baitapMVVM
//
//  Created by user on 1/21/20.
//  Copyright © 2020 VienH. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupData()
        setupUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK : setup Data & UI
    func setupData() {
    }

    func setupUI() {
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back",
            style: .plain,
            target: nil,
            action: nil)
    }

}
