//
//  WellcomeViewController.swift
//  Navigation
//
//  Created by PhuocNguyen on 10/15/19.
//  Copyright © 2019 Tien Le P. All rights reserved.
//

import UIKit

class WellcomeViewController: UIViewController {
    
    @IBOutlet weak var userNameLabel: UILabel!
    var userName: String = ""
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
    
    func setupNavi() {
        title = "Home"
        let editButton = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(pushToEditViewController))
        let logoutButton = UIButton(type: .system)
        let attribute: [NSAttributedString.Key : Any] = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17)]
        logoutButton.setAttributedTitle(NSAttributedString(string: "Logout", attributes: attribute), for: .normal)
        logoutButton.addTarget(self, action: #selector(logout), for: .touchUpInside)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: logoutButton)
        navigationItem.rightBarButtonItem = editButton
    }
    
    @objc func pushToEditViewController() {
        let vc = EditViewController()
        vc.user = user
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func logout() {
        UserDefaults.standard.set(nil, forKey: "username")
        navigationController?.popViewController(animated: true)
    }
    
}
