//
//  EditViewController.swift
//  Navigation
//
//  Created by PCI0018 on 10/31/19.
//  Copyright © 2019 Thong Nguyen T. All rights reserved.
//

import UIKit

final class EditViewController: UIViewController {

    @IBOutlet private weak var newPasswordTextField: UITextField!
    @IBOutlet private weak var confirmPasswordTextField: UITextField!
    @IBOutlet private weak var usernameTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        usernameTextField.delegate = self
        newPasswordTextField.delegate = self
        confirmPasswordTextField.delegate = self
        
        title = "Edit"
        guard let usernamePresent = UserDefaults.standard.string(forKey: "usernamePresent") else { return }
        usernameTextField.text = "\(usernamePresent)"

        // add cancel button by custome view
        let cancelButton = UIButton(frame: CGRect(x: 0, y: 0, width: 60, height: 44))
        cancelButton.addTarget(self, action: #selector(clickCancelButton), for: .touchUpInside)
        cancelButton.setTitle("Cancel", for: .normal)
        if #available(iOS 13.0, *) {
            cancelButton.setTitleColor(UIColor.link, for: .normal)
        } else {
            cancelButton.setTitleColor(UIColor.black, for: .normal)
        }

        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(clickDone))
        let leftCustomView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 44))
        let leftBarButton = UIBarButtonItem(customView: leftCustomView)
        leftCustomView.addSubview(cancelButton)
        navigationItem.leftBarButtonItem = leftBarButton
        navigationItem.rightBarButtonItems = [doneButton]
    }

    @objc private func clickCancelButton() {
        navigationController?.popViewController(animated: true)
    }

    @objc private func clickDone() {
        guard let newPassword = newPasswordTextField.text, !newPassword.isEmpty, let confirmPass = confirmPasswordTextField.text, confirmPass == newPassword else { return }
        UserDefaults.standard.set(newPassword, forKey: "newPasswordKey")
        guard let usernamePresent = UserDefaults.standard.string(forKey: "usernamePresent") else { return }
        DataManagement.share.writePlistToList(usernamePresent: usernamePresent , newPassword: newPassword)
        navigationController?.popViewController(animated: true)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}

extension EditViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField.tag {
        case 0:
            newPasswordTextField.becomeFirstResponder()
        case 1:
            confirmPasswordTextField.becomeFirstResponder()
        case 2:
            clickDone()
        default:
            break
        }
        return true
    }
}
