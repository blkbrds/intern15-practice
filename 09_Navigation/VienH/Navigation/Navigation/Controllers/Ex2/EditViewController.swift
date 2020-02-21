//
//  EditViewController.swift
//  Navigation
//
//  Created by user on 12/11/19.
//  Copyright © 2019 VienH. All rights reserved.
//

import UIKit

final class EditViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Edit"
        configNavigationBar()
    }

    private func configNavigationBar() {
        let rightButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(popToHome))
        navigationItem.rightBarButtonItem = rightButton
    }

    @objc private func popToHome() {
        let vc = HelloViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
