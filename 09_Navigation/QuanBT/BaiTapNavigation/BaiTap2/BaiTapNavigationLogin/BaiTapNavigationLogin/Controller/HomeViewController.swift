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
        usernameLabel.text = username
    }
    
    // MARK: - Function
    private func setupView() {
        title = "Home"
        let logoutButton = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(logoutTouchUpInside))
        navigationItem.leftBarButtonItem = logoutButton
        let editButton = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(editTouchUpInside))
        navigationItem.rightBarButtonItem = editButton
    }
    
    @objc private func logoutTouchUpInside(){
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc private func editTouchUpInside(){
        let vcEdit = EditViewController()
        self.navigationController?.pushViewController(vcEdit, animated: true)
    }
}
