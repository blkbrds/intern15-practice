//
//  HelloViewController.swift
//  Navigation
//
//  Created by user on 12/11/19.
//  Copyright © 2019 VienH. All rights reserved.
//

import UIKit

final class HelloViewController: UIViewController {

    var username = ""
    @IBOutlet weak var userNameLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        userNameLabel.text = "Hello, \(username)!"
        configNavigationBar()
    }

    private func configNavigationBar() {
        let rightButton = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(pushToViewController))
        navigationItem.rightBarButtonItem = rightButton
    }

    @objc private func pushToViewController() {
        let vc = EditViewController()
        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func pushToPreviousButton() {
        navigationController?.popViewController(animated: true)

    }
}
