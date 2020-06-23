//
//  EditViewController.swift
//  Navigation
//
//  Created by PCI0019 on 6/19/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

class EditViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var newPasswordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Edit"
        setupView()
    }
    func setupView() {
          let backButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItem.Style.plain, target: self, action: #selector(popHomeViewController))
          let nextButton = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.plain, target: self, action: #selector(editHomeViewController))
          navigationItem.leftBarButtonItem = backButton
          navigationItem.rightBarButtonItem = nextButton
      }
    @objc func popHomeViewController() {
        navigationController?.popViewController(animated: true )
    }
    @objc func editHomeViewController() {
        guard let text = usernameTextField.text else {return }
        let vc = navigationController?.viewControllers[1]
        if vc is HomeViewController {
            (vc as! HomeViewController).welcomeLabel.text = text
            navigationController?.popViewController(animated: true )
        }
    }
}
