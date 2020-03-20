//
//  LoginViewController.swift
//  BaiTapView
//
//  Created by ADMIN on 3/19/2563 BE.
//  Copyright © 2563 BE asiantech. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var userNameField: UITextField!
    @IBOutlet weak var passWordField: UITextField!
    @IBOutlet weak var clearField: UIButton!
    @IBOutlet weak var loginField: UIButton!
    
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet var errorField: UILabel!
    private let username :String = "Admin"
    private let password :String = "Admin123"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func setUpUITextView(textField :UITextView) {
        textField.layer.borderColor = UIColor.black.cgColor
        
    }
    @IBAction func clickClearButton(_ sender: Any) {
    }
    
    @IBOutlet var clickOutsideButton: UIView!
    @IBAction func clickLoginButton(_ sender: UIButton) {
        }
    

}
