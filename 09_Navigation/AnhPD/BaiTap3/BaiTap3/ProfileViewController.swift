//
//  ProfileViewController.swift
//  BaiTap3
//
//  Created by PCI0012 on 4/28/20.
//  Copyright © 2020 PCI0012. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var profileImageView: UIImageView!
    
    var imageName: String = ""
    var userName: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profile"
        backButtonTouchUpInSide()
        doneButtonTouchUpInSide()
        setupUI()
        // Do any additional setup after loading the view.
    }
    
    func setupUI() {
        userNameTextField.text = userName
        profileImageView.image = UIImage(named: imageName)
    }
    func backButtonTouchUpInSide() {
        let backButton = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(backTouchUpInSide))
        navigationItem.leftBarButtonItem = backButton
    }
    
    @objc func backTouchUpInSide() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func doneButtonTouchUpInSide() {
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneTouchUpInSide))
        navigationItem.rightBarButtonItem = doneButton
    }
    
    @objc func doneTouchUpInSide() {
        self.navigationController?.popViewController(animated: true)
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
