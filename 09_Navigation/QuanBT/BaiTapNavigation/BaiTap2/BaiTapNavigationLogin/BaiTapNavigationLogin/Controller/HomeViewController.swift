//
//  HomeViewController.swift
//  BaiTapNavigationLogin
//
//  Created by Sếp Quân on 3/26/20.
//  Copyright © 2020 QuanBT. All rights reserved.
//

import UIKit

final class HomeViewController: UIViewController {
    // MARK: - IBOutlet
    @IBOutlet weak var usernameLabel: UILabel!
    
    // MARK: - Properties
    var username = ""
    
    // MARK: - Override
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        usernameLabel.text = username
    }
    
    // MARK: - Function
    private func setupView() {
        title = "Home"
        let logoutButton = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(logoutButtonTouchUpInside))
        navigationItem.leftBarButtonItem = logoutButton
        let editButton = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(editButtonTouchUpInside))
        navigationItem.rightBarButtonItem = editButton
    }
    
    @objc private func logoutButtonTouchUpInside() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func editButtonTouchUpInside() {
        let vcEdit = EditViewController()
        navigationController?.pushViewController(vcEdit, animated: true)
    }
}
