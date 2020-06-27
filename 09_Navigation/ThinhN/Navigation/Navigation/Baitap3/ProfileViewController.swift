//
//  ProfileViewController.swift
//  Navigation
//
//  Created by ADMIN on 6/21/2563 BE.
//  Copyright © 2563 BE asiantech. All rights reserved.
//

import UIKit

protocol ProfileViewControllerDelegate: class {
    func updateName(viewController: ProfileViewController, name: String)
}
class ProfileViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    
    weak var delegate: ProfileViewControllerDelegate?
    var name: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profile"
        nameTextField.text = name
        setupView()
    }
    func setupView() {
        let doneButton = UIBarButtonItem(title: "Done", style:.plain, target: self, action: #selector(doneButtonTouchUpInsine))
        navigationItem.rightBarButtonItem = doneButton
    }
    @objc func doneButtonTouchUpInsine() {
        delegate?.updateName(viewController: self, name: nameTextField.text ?? "")
        navigationController?.popViewController(animated: true)
    }
}
