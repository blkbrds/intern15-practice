//
//  HomeViewController.swift
//  BaiTap02
//
//  Created by PCI0002 on 11/27/19.
//  Copyright © 2019 TranVanTien. All rights reserved.
//

import UIKit

final class HomeViewController: BaseViewController {

    @IBOutlet private weak var welcomeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let userName = UserDefaults.standard.string(forKey: "userName") else { return }
        welcomeLabel.text = "Welcome \(userName)"
    }
    override func setupUI() {
        super.setupUI()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(editPassword))
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(logout))
    }

    @objc private func editPassword() {
        let editVC = EditViewController()
        navigationController?.pushViewController(editVC, animated: true)
    }

    @objc private func logout() {
        UserDefaults.standard.set(nil, forKey: "userName")
        UserDefaults.standard.set(nil, forKey: "password")
        navigationController?.popToRootViewController(animated: true)
    }

}
