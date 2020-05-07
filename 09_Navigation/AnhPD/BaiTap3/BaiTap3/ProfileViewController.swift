//
//  ProfileViewController.swift
//  BaiTap3
//
//  Created by PCI0012 on 5/6/20.
//  Copyright © 2020 PCI0012. All rights reserved.
//

import UIKit

protocol ProfileViewControllerDelegate {
    func updateData(userName: String, index: Int)
}

class ProfileViewController: UIViewController {

    @IBOutlet weak var avatarProfileImageView: UIImageView!
    @IBOutlet weak var userNameProfileTextField: UITextField!
    
    var userName: String = ""
    var imageView: String = ""
    var index: Int?
    var delegate: ProfileViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profile"
        updateUI()
        configNavigationBar()
        // Do any additional setup after loading the view.
    }
    
    func configNavigationBar() {
        let backButton = UIBarButtonItem(title: "<Back", style: .plain, target: self, action: #selector(backTouchUpInSide))
        navigationItem.leftBarButtonItem = backButton
        
        let doneButton = UIBarButtonItem(title: "Done>", style: .plain, target: self, action: #selector(doneButtonTouchUpInSide))
        navigationItem.rightBarButtonItem = doneButton
    }
    
    @objc func backTouchUpInSide() {
        if let navigationController = navigationController {
            navigationController.popViewController(animated: true)
        }
    }
    
    @objc func doneButtonTouchUpInSide() {
        if let delegate = delegate, let index = index {
            delegate.updateData(userName: userNameProfileTextField.text ?? "", index: index)
        }
        
        if let navigationController = navigationController {
            navigationController.popViewController(animated: true)
        }
    }
    
    private func updateUI() {
        userNameProfileTextField.text = userName
        avatarProfileImageView.image = UIImage(named: imageView)
    }
}
