//
//  HomeViewController.swift
//  BaiTap2
//
//  Created by PCI0012 on 4/27/20.
//  Copyright © 2020 PCI0012. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var userNameTextField: UITextField!
    
    var userName: String = ""
    var passWord: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        logoutButton()
        editButton()
        setupUI()
        // Do any additional setup after loading the view.
    }
    
    private func setupUI() {
        userNameTextField.text = userName
    }
    
    func logoutButton() {
        let logoutButton = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(logoutTouchUpInSide))
        navigationItem.leftBarButtonItem = logoutButton
    }
    
    @objc func logoutTouchUpInSide() {
        let vc = (self.navigationController?.viewControllers[0])!
        self.navigationController?.popToViewController(vc, animated: true)
    }
    
    func editButton() {
        let editButton = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(editButtonTouchUpInSide))
        navigationItem.rightBarButtonItem = editButton
    }
    
    @objc func editButtonTouchUpInSide() {
        let vc = EditViewController()
        vc.delegate = self
        self.navigationController?.pushViewController(vc, animated: true)
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

extension HomeViewController: EditViewControllerDelegate {
    
    func saveSuccess(userName: String) {
        userNameTextField.text = userName
    }
}
