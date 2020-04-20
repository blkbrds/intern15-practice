//
//  AddViewController.swift
//  BaiTapDemoRealm
//
//  Created by Sếp Quân on 4/19/20.
//  Copyright © 2020 QuanBT. All rights reserved.
//

import UIKit
import RealmSwift

final class AddViewController: UIViewController {
    // MARK: - IBOutlet
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var typeTextField: UITextField!
    @IBOutlet weak var countLabel: UILabel!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    // MARK: - Function
    private func setupView() {
        title = "Add Category"
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneButtonTouchUpInside))
        navigationItem.rightBarButtonItem = doneButton
    }
    
    @objc func doneButtonTouchUpInside() {
        guard let title = titleTextField.text,
            let type = Int(typeTextField.text ?? "0") else { return }
        
        do {
            // realm
            let realm = try Realm()
            let results = realm.objects(Category.self)
            
            // category
            let category = Category()
            category.title = title
            category.type = type
            category.count = results.count

            // add to realm
            try realm.write {
                realm.add(category)
            }
            
            self.navigationController?.popViewController(animated: true)
            
        } catch {
            print("Lỗi thêm đối tượng vào Realm")
        }
    }
}
