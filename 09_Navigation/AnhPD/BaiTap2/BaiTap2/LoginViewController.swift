//
//  LoginViewController.swift
//  BaiTap2
//
//  Created by PCI0012 on 4/27/20.
//  Copyright © 2020 PCI0012. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passWordTextField: UITextField!
    
    var userName: String = "Anh"
    var passWord: String = "123"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Login"
        doneButton()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        userNameTextField.text = ""
        passWordTextField.text = ""
    }
    
    func doneButton() {
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneTouchUpInside))
        navigationItem.rightBarButtonItem = doneButton
    }
    
    @objc func doneTouchUpInside() {
        if userNameTextField.text == self.userName && passWordTextField.text == self.passWord {
            let vc = HomeViewController()
            vc.userName = userName
            navigationController?.pushViewController(vc, animated: true)
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
