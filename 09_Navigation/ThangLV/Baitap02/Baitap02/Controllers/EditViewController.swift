//
//  EditViewController.swift
//  Baitap02
//
//  Created by PCI0008 on 1/3/20.
//  Copyright © 2020 PCI0008. All rights reserved.
//

import UIKit

protocol EditViewControllerDelegate: class {
    func updateDataToHomePage(name: String)
}

class EditViewController: UIViewController {
    
    
    @IBOutlet weak var userNameTextField: UITextField!
    
    var delegate: EditViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Edit"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(touchUpInsideCancelButton))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(touchUpInsideDoneButton))
    }
    
    @objc func touchUpInsideCancelButton() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func touchUpInsideDoneButton() {
        navigationController?.popViewController(animated: true)
        delegate?.updateDataToHomePage(name: userNameTextField.text!)
    }
}
