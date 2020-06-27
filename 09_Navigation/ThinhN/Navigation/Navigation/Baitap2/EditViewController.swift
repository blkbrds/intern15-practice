//
//  EditViewController.swift
//  Navigation
//
//  Created by PCI0019 on 6/19/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

protocol EdidViewControllerDelegate: class {
    func editUsername(view: EditViewController, text: String)
}
class EditViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var newPasswordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    weak var delegate: EdidViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Edit"
        setupView()
    }
    func setupView() {
          let backButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItem.Style.plain, target: self, action: #selector(backButtonTouchUpInside))
          let nextButton = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.plain, target: self, action: #selector(doneButtonTouchUpInside))
          navigationItem.leftBarButtonItem = backButton
          navigationItem.rightBarButtonItem = nextButton
      }
    @objc func backButtonTouchUpInside() {
        navigationController?.popViewController(animated: true )
    }
    @objc func doneButtonTouchUpInside() {
        guard let text = usernameTextField.text, let delegate = delegate else { return }
        delegate.editUsername(view: self, text: text)
        navigationController?.popViewController(animated: true)
    }
}
