//
//  ProfileViewController.swift
//  Baitap02_Avatar
//
//  Created by PhuocNguyen on 10/16/19.
//  Copyright © 2019 PhuocNguyen. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet private weak var avatarImageView: UIImageView!
    @IBOutlet private weak var userNameTextField: UITextField!
    var user: User?
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavi()
        setupUI()
    }
    
    func setupUI() {
        guard let user = user else { return }
        avatarImageView.image = UIImage(named: user.avatarImageName)
        userNameTextField.text = user.userName
    }
    
    func setupNavi() {
        title = "Profile"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(editProfile))
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(popToView))
    }
    
    @objc func editProfile() {
        if let user = self.user, let username = userNameTextField.text, username != user.userName {
            DataManagement.share.writePlistToList(user: user, username: username)
            navigationController?.popViewController(animated: true)
        } else {
            print("change fail")
        }
    }
    
    @objc func popToView() {
        navigationController?.popViewController(animated: true)
    }
}
