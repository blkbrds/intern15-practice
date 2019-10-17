//
//  WellcomeViewController.swift
//  Navigation
//
//  Created by PhuocNguyen on 10/15/19.
//  Copyright © 2019 Tien Le P. All rights reserved.
//

import UIKit

final class WellcomeViewController: UIViewController {
    
    @IBOutlet private weak var userNameLabel: UILabel!
    
    private var userName: String = ""
    var user: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavi()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let username = UserDefaults.standard.string(forKey: "username") else { return }
        userNameLabel.text = "Wellcome \(username)"
    }
    
    private func setupNavi() {
        title = "Home"
        let editButton = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(pushToEditViewController))
        let logOutButton = UIButton(type: .system)
        let attribute: [NSAttributedString.Key: Any] = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17)]
        logOutButton.setAttributedTitle(NSAttributedString(string: "Logout", attributes: attribute), for: .normal)
        logOutButton.addTarget(self, action: #selector(logout), for: .touchUpInside)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: logOutButton)
        navigationItem.rightBarButtonItem = editButton
    }
    
    @objc private func pushToEditViewController() {
        let vc = EditViewController()
        vc.user = user
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func logout() {
        UserDefaults.standard.set(nil, forKey: "username")
        navigationController?.popViewController(animated: true)
    }
}
