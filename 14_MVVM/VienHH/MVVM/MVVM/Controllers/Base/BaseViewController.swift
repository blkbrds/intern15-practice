//
//  BaseViewController.swift
//  MVVM
//
//  Created by user on 1/22/20.
//  Copyright © 2020 VienH. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupData()
        setupUI()
    }

    func setupData() { }

    func setupUI() {}

    func pushViewController(viewcontroller: UIViewController) {
        navigationController?.pushViewController(viewcontroller, animated: true)
    }

    func popViewController() {
        navigationController?.popViewController(animated: true)
    }
}
