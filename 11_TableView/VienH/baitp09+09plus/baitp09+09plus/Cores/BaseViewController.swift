//
//  BaseViewController.swift
//  baitp09+09plus
//
//  Created by user on 12/23/19.
//  Copyright © 2019 VienH. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupData()
    }

    // MARK: - Custom funcs
    func setupData() { }

    func setupUI() { }

    func pushViewController(viewcontroller: UIViewController) {
        navigationController?.pushViewController(viewcontroller, animated: true)
    }
}
