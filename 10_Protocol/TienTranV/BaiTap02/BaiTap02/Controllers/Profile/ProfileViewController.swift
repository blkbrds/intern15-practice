//
//  ProfileViewController.swift
//  BaiTap03
//
//  Created by TranVanTien on 11/28/19.
//  Copyright © 2019 TranVanTien. All rights reserved.
//

import UIKit

protocol ProfileViewControllerDelegate: class {
    func controller(controller: ProfileViewController, needPerformAction action: ProfileViewController.Action)
}

final class ProfileViewController: BaseViewController {

    @IBOutlet private weak var avatarImageView: UIImageView!
    @IBOutlet private weak var avartarNameTextField: UITextField!
    var avatar: Avatar?
    var index: Int?
    
    weak var delegate: ProfileViewControllerDelegate?

    enum Action {
        case reloadAvatarView(index: Int, newName: String)
    }

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
        guard let index = index, let avatarName = avartarNameTextField.text else { return }
        delegate?.controller(controller: self, needPerformAction: .reloadAvatarView(index: index, newName: avatarName))
        navigationController?.popViewController(animated: true)
    }

    private func fetchUI(avatar: Avatar) {
        self.avatar = avatar
        avatarImageView.image = UIImage(named: avatar.avatarImageName)
        avartarNameTextField.text = avatar.avatarName
    }
}
