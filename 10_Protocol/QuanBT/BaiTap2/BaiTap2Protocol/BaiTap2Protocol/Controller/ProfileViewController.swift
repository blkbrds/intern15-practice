//
//  ProfileViewController.swift
//  BaiTap2Protocol
//
//  Created by Sếp Quân on 3/30/20.
//  Copyright © 2020 QuanBT. All rights reserved.
//

import UIKit

protocol MyProfileDelegate: class {
    func profileName(name: String)
}

final class ProfileViewController: UIViewController {
    // MARK: - IBOutlet
    @IBOutlet private weak var nameTextField: UITextField!
    
    // MARK: - Properties
    var username = ""
    weak var delegate: MyProfileDelegate?
    
    //MARK: - Override
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        title = "Profile"
        nameTextField.text = username
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneTouchUpInside))
        navigationItem.rightBarButtonItem = doneButton
    }
    
    //MARK: - Function
    @objc private func doneTouchUpInside(){
        if let username = nameTextField.text {
            let vcHome = self.navigationController?.viewControllers[0] as! AvatarViewController
            delegate?.profileName(name: username)
            self.navigationController?.popToViewController(vcHome, animated: true)
        }
    }
}

