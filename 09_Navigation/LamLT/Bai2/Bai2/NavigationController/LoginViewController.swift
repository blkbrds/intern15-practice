

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
        let rightButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(nextAction))
        navigationItem.rightBarButtonItem = rightButton
        passWordTextField.isSecureTextEntry = true
        alertLabel.isHidden = true
    }
    
    @objc private func nextAction() {
            let userAccount: (String, String) = (userNameTextField.text!, passWordTextField.text!)
            if userAccount == (userName, passWord) {
                let nextHomeView = HomeViewController()
                self.navigationController?.pushViewController(nextHomeView, animated: true)
            } else {
                alertLabel.isHidden = false
            }
        
    }
}
