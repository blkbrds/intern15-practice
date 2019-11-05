//
//  Ex3ViewController.swift
//  PracticeTemplate
//
//  Created by Tien Le P. on 6/22/18.
//  Copyright © 2018 Tien Le P. All rights reserved.
//

import UIKit

class Ex3ViewController: BaseViewController {
    
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var usersNameTextField: UITextField!
    
    var user: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavi()
        setupUI()
    }
    override func setupUI() {
         guard let user = user else { return }
         avatarImageView.image = UIImage(named: user.avatarImageView)
         usersNameTextField.text = user.userName
    }
    
    private func setupNavi() {
        title = "Profile"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(editProfile))
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(popToView))
    }
    @objc private func editProfile() {
        if let user = self.user, let username = usersNameTextField.text, username != user.userName {
            Ex2DataManagement.shared.writePlistToList(user: user, username: username)
             navigationController?.popViewController(animated: true)
        } else {
            print("loi roi")
        }
    }
    @objc private func popToView() {
        navigationController?.popViewController(animated: true)
    }
}
