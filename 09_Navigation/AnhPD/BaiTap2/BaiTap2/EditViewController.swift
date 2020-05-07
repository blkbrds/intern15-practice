//
//  EditViewController.swift
//  BaiTap2
//
//  Created by PCI0012 on 4/27/20.
//  Copyright © 2020 PCI0012. All rights reserved.
//

import UIKit

protocol EditViewControllerDelegate: class {
    func saveSuccess(userName: String?)
}

class EditViewController: UIViewController {

    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var confirmPassTextField: UITextField!
    @IBOutlet weak var newPassTextField: UITextField!
    
    var userName: String = ""
    weak var delegate: EditViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Edit"
        cancelButton()
        doneButton()
        // Do any additional setup after loading the view.
    }
    
    func cancelButton() {
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelTouchUpInSide))
        navigationItem.leftBarButtonItem = cancelButton
    }
    
    @objc func cancelTouchUpInSide() {
        let vc = (self.navigationController?.viewControllers[1])!
        self.navigationController?.popToViewController(vc, animated: true)
    }
    
    func doneButton() {
        let editButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneButtonTouchUpInSide))
        navigationItem.rightBarButtonItem = editButton
    }
    
    @objc func doneButtonTouchUpInSide() {
        if let delegate = delegate {
            delegate.saveSuccess(userName: userNameTextField.text)
        }
        if let navigationController = navigationController {
            navigationController.popViewController(animated: true)
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
