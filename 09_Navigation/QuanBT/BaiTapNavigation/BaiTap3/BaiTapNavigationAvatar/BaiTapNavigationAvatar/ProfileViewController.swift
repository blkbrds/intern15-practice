//
//  ProfileViewController.swift
//  BaiTapNavigationAvatar
//
//  Created by Sếp Quân on 3/27/20.
//  Copyright © 2020 QuanBT. All rights reserved.
//

import UIKit

final class ProfileViewController: UIViewController {
    // MARK: - IBOutlet
    @IBOutlet weak var nameTextField: UITextField!
    
    // MARK: - Properties
    var username = ""
    var temp = 0
    
    //MARK: - Override
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = "Profile"
        nameTextField.text = username
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneButtonTouchUpInside))
        navigationItem.rightBarButtonItem = doneButton
    }
    
    //MARK: - Function
    @objc private func doneButtonTouchUpInside() {
        if let username = nameTextField.text {
            if let vcHome = navigationController?.viewControllers[0] as? AvatarViewController {
                vcHome.usenames[temp] = username
                navigationController?.popToViewController(vcHome, animated: true)
            }
        }
    }
}
