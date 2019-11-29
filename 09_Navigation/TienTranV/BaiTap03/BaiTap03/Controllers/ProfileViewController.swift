//
//  ProfileViewController.swift
//  BaiTap03
//
//  Created by TranVanTien on 11/28/19.
//  Copyright © 2019 TranVanTien. All rights reserved.
//

import UIKit

enum Key: String {
    case avatarName = "avatarName"
    case avatarImageName = "avatarImageName"
    case indexRow = "indexRow"
}

final class ProfileViewController: BaseViewController {


    @IBOutlet private weak var avatarImageView: UIImageView!
    @IBOutlet private weak var avartarNameTextField: UITextField!
    var avatar: Avatar?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupUI()
        guard let avatar = avatar else { return }
        fetchUI(avatar: avatar)
    }

    override func setupUI() {
        super.setupUI()
        title = "Profile"

        let doneBarItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(handleDone))
        navigationItem.rightBarButtonItem = doneBarItem
    }

    @objc private func handleDone() {
        guard avartarNameTextField.text == avatar?.avatarName else {
            guard let avatarName = avartarNameTextField.text else { return }
            UserDefaults.standard.set(avatarName, forKey: Key.avatarName.rawValue)
            navigationController?.popViewController(animated: true)
            return
        }
        navigationController?.popViewController(animated: true)
    }

    private func fetchUI(avatar: Avatar) {
        self.avatar = avatar
        avatarImageView.image = UIImage(named: avatar.avatarImageName)
        avartarNameTextField.text = avatar.avatarName
    }
}
