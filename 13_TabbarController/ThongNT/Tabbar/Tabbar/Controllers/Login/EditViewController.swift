//
//  EditViewController.swift
//  Navigation
//
//  Created by PCI0018 on 10/31/19.
//  Copyright © 2019 Thong Nguyen T. All rights reserved.
//

import UIKit

final class EditViewController: BaseViewController {

    @IBOutlet private weak var newPasswordTextField: UITextField!
    @IBOutlet private weak var confirmPasswordTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        newPasswordTextField.delegate = self
        confirmPasswordTextField.delegate = self
    }

    override func setupUI() {
        super.setupUI()
        title = "Edit"

        // Add cancel button by custom view
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
        UserDefaults.standard.setValue(newPassword, forKey: "newPassword")

        let alert = UIAlertController(title: "Thông Báo", message: "Bạn cần đăng nhập lại sau khi đổi mật khẩu", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
            SceneDelegate.shared.willLogin()
        }))
        present(alert, animated: true, completion: nil)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
}

extension EditViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField.tag {
        case 0:
            confirmPasswordTextField.becomeFirstResponder()
        case 1:
            clickDone()
        default:
            break
        }
        return true
    }
}
