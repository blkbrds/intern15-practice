//
//  SecondHomeViewController.swift
//  Navigation
//
//  Created by PCI0018 on 10/31/19.
//  Copyright © 2019 Thong Nguyen T. All rights reserved.
//

import UIKit

final class SecondHomeViewController: UIViewController {
    @IBOutlet weak var usernameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        
        guard let username = UserDefaults.standard.string(forKey: "usernamePresent") else { return }
        usernameLabel.text = username
        
        let editButton = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(clickEditButton))
        navigationItem.rightBarButtonItems = [editButton]
        
        // add logout button by custome view
        let logoutButton = UIButton(frame: CGRect(x: 0, y: 0, width: 60, height: 44))
        logoutButton.addTarget(self, action: #selector(clickLogoutButton), for: .touchUpInside)
        logoutButton.setTitle("Logout", for: .normal)
        if #available(iOS 13.0, *) {
            logoutButton.setTitleColor(UIColor.link, for: .normal)
        } else {
            logoutButton.setTitleColor(UIColor.black, for: .normal)
        }
        
        let leftCustomView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 44))
        leftCustomView.addSubview(logoutButton)
        let leftBarButton = UIBarButtonItem(customView: leftCustomView)
        navigationItem.leftBarButtonItem = leftBarButton
    }
    
    @objc private func clickEditButton() {
        navigationController?.pushViewController(EditViewController(), animated: true)
    }
    
    @objc private func clickLogoutButton() {
        navigationController?.popViewController(animated: true)
        UserDefaults.standard.set(nil, forKey: "usernamePresent")
    }
}
