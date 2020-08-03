//
//  AddCategoryViewController.swift
//  BaiTap5Realm
//
//  Created by Sếp Quân on 4/22/20.
//  Copyright © 2020 QuanBT. All rights reserved.
//

import UIKit

protocol AddCategoryViewControllerDelegate: class {
    func addCategoryToRealm(with object: Category)
}

final class AddCategoryViewController: UIViewController {
    // MARK: - IBOutlet
    @IBOutlet private weak var typeTextField: UITextField!
    @IBOutlet private weak var titleTextField: UITextField!
    
    // MARK: - Properties
    weak var delegate: AddCategoryViewControllerDelegate?
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Function
    private func setupUI() {
        title = "Add Category"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneCreate))
    }
    
    @objc private func doneCreate() {
        guard let title = titleTextField.text, !title.isEmpty,
            let type = typeTextField.text, !type.isEmpty else { return }
        let category = Category()
        category.type = type
        category.title = title
        delegate?.addCategoryToRealm(with: category)
        navigationController?.popViewController(animated: true)
    }
}
