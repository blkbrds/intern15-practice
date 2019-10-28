//
//  ProfileViewController.swift
//  TableView
//
//  Created by PhuocNguyen on 10/18/19.
//  Copyright © 2019 PhuocNguyen. All rights reserved.
//

import UIKit

protocol ProfileViewControllerDelegate: class {
    //func editContact()
    func addContact(_ contact: Contact)
}

final class ProfileViewController: UIViewController {
    
    @IBOutlet private weak var nameTextField: UITextField!
    @IBOutlet private weak var phoneNumberTextField: UITextField!
    
    enum Action {
        case edit
        case add
    }
    
    weak var delegate: ProfileViewControllerDelegate?
    var action: Action = .add
    var contact: Contact?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupNavi()
    }
    
    private func setupNavi() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(popToPreView))
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(finishUpdateContact))
    }
    
    private func setupUI() {
        if let contact = contact {
            nameTextField.text = contact.name
            phoneNumberTextField.text = contact.phoneNumber
        }
    }
    
    @objc private func popToPreView() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func finishUpdateContact() {
        guard let name = nameTextField.text, let phoneNumber = phoneNumberTextField.text, !phoneNumber.isEmpty else { return }
        switch action {
        case .add:
            let contactAdd = Contact(name: name, phoneNumber: phoneNumber)
            delegate?.addContact(contactAdd)
        case .edit:
            contact?.name = name
            contact?.phoneNumber = phoneNumber
        }
        navigationController?.popViewController(animated: true)
    }
}
