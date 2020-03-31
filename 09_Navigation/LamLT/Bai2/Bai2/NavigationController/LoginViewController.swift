

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passWordTextField: UITextField!
    @IBOutlet weak var alertLabel: UILabel!
    
    var userName: String = "Hey"
    var passWord: String = "WhatTheFuckMan"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Login"
        let rightButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(nextActionButtonTouchUpInSide))
        navigationItem.rightBarButtonItem = rightButton
        passWordTextField.isSecureTextEntry = true
        alertLabel.isHidden = true
    }
    
    @objc private func nextActionButtonTouchUpInSide() {
        let userAccount: (userName: String, String) = (userNameTextField.text!, passWordTextField.text!)
            if userAccount == (userName, passWord) {
                let nextHomeViewController = HomeViewController()
                nextHomeViewController.userName = userAccount.userName
                nextHomeViewController.password = userAccount.1
                self.navigationController?.pushViewController(nextHomeViewController, animated: true)
            } else {
                alertLabel.isHidden = false
            }
        
    }
}
