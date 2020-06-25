//
//  ProfileViewController.swift
//  Protocol
//
//  Created by PCI0019 on 6/23/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit
protocol ProfileViewControllerDelegate: class {
    func showEditNameLabel(viewController: ProfileViewController, text: String)
}

class ProfileViewController: UIViewController {

    weak var delegate: ProfileViewControllerDelegate?
    var name: String = ""
    
    
    @IBOutlet weak var nameTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.text = name
        setUpView()
    }
    func setUpView() {
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.plain, target: self, action: #selector(doneButtonTouchUpInside))
        navigationItem.rightBarButtonItem = doneButton
    }
    @objc func doneButtonTouchUpInside() {
        guard let delegate = delegate, let text = nameTextField.text else { return }
        delegate.showEditNameLabel(viewController: self, text: text)
        navigationController?.popViewController(animated: true)
    }
}
