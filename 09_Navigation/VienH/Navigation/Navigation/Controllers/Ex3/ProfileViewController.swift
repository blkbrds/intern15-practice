//
//  ProfileViewController.swift
//  Navigation
//
//  Created by user on 12/11/19.
//  Copyright © 2019 VienH. All rights reserved.
//

import UIKit

final class ProfileViewController: UIViewController {

    @IBOutlet weak var profileTextfield: UITextField!
    @IBOutlet weak var profileImageView: UIImageView!

    var name: String?
    var image: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavi()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupUI()
    }

    private func setupUI() {
        guard let name = name, let image = image else { return }
        profileImageView.image = UIImage(named: image)
        profileTextfield.text = name
    }

    private func setupNavi() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(popToView))

    }
    @objc private func popToView() {
        navigationController?.popViewController(animated: true)
    }
}


