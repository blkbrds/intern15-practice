//
//  AddCategoryViewController.swift
//  DemoRealm
//
//  Created by PhuocNguyen on 11/4/19.
//  Copyright © 2019 PhuocNguyen. All rights reserved.
//

import UIKit

protocol AddCategoryViewControllerDelegate: class {
    func addCategoryToRealm(with object: Category)
}

class AddCategoryViewController: UIViewController {
    
    @IBOutlet weak var typeTextField: UITextField!
    @IBOutlet weak var titleTextField: UITextField!
    
    weak var delegate: AddCategoryViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        title = "Add Category"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneCreate))
    }
    
    @objc private func doneCreate() {
        guard let title = titleTextField.text, !title.isEmpty,
            let type = typeTextField.text, !type.isEmpty else { return }
        let category = Category()
        category.type = type
        category.name = title
        delegate?.addCategoryToRealm(with: category)
        navigationController?.popViewController(animated: true)
    }
}
