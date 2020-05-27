//
//  AutoLayoutViewController.swift
//  BTAutoLayoutBS
//
//  Created by Sếp Quân on 3/25/20.
//  Copyright © 2020 QuanBT. All rights reserved.
//

import UIKit

class AutoLayoutViewController: UIViewController {
    // MARK: - IBOutlet
    @IBOutlet weak var signinButton: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var googleButton: UIButton!
    @IBOutlet weak var wkButton: UIButton!
    @IBOutlet weak var faceButton: UIButton!
    @IBOutlet weak var googleConstraint: NSLayoutConstraint!
    
    // MARK: - Override
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    // MARK: - Function
    private func  setupView() {
        emailTextField.layer.borderWidth = 2
        emailTextField.layer.borderColor = UIColor.gray.cgColor
        emailTextField.layer.cornerRadius = emailTextField.frame.size.height / 2
        emailTextField.clipsToBounds = true
        passwordTextField.layer.borderWidth = 2
        passwordTextField.layer.borderColor = UIColor.gray.cgColor
        passwordTextField.layer.cornerRadius = passwordTextField.frame.size.height / 2
        passwordTextField.clipsToBounds = true
        loginButton.layer.borderWidth = 2
        loginButton.layer.borderColor = UIColor.gray.cgColor
        loginButton.layer.cornerRadius = loginButton.frame.size.height / 2
        loginButton.clipsToBounds = true
        googleButton.layer.borderWidth = 2
        googleButton.layer.borderColor = UIColor.gray.cgColor
        googleButton.layer.cornerRadius = googleButton.frame.size.width / 2
        googleButton.clipsToBounds = true
        wkButton.layer.borderWidth = 2
        wkButton.layer.borderColor = UIColor.gray.cgColor
        wkButton.layer.cornerRadius = wkButton.frame.size.width / 2
        wkButton.clipsToBounds = true
        faceButton.layer.borderWidth = 2
        faceButton.layer.borderColor = UIColor.gray.cgColor
        faceButton.layer.cornerRadius = faceButton.frame.size.width / 2
        faceButton.clipsToBounds = true
    }
}
