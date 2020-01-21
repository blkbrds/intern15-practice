//
//  BaseViewController.swift
//  baitap13
//
//  Created by user on 1/20/20.
//  Copyright © 2020 VienH. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func setupUI() {
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back",
            style: .plain,
            target: nil,
            action: nil)
    }

    func setupData() { }
}
