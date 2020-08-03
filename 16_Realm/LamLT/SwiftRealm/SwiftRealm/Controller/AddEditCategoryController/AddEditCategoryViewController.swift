//
//  AddEditCategoryViewController.swift
//  SwiftRealm
//
//  Created by PCI0002 on 5/13/20.
//  Copyright © 2020 LeThanhLam. All rights reserved.
//

import UIKit
import RealmSwift

class AddEditCategoryViewController: BaseViewController {

    // MARK: - IBOutlet
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var typeTextField: UITextField!
    @IBOutlet weak var deleteCategoryButton: UIButton!

    // MARK: - Properties
    var titleName: String = ""
    var typeName: String = ""
    var count: Int = 0
    var isAdd: Bool = false
    var category: Category?
    let curentDate = NSDate()
    let dateFormatter = DateFormatter()
    let currentDateTime = Date()
    let formatter = DateFormatter()

    var viewModel: AddEditCategoryViewModel? {
        didSet {

        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
    }

    override func setUpUI() {
        title = isAdd ? "New Category" : "Edit Category"

        deleteCategoryButton.isHidden = isAdd
    }

    func updateView() {
        guard let viewModel = viewModel else {
            return
        }
        category = viewModel.category
        guard let category = category else {
            return
        }
        print(category)
        print(category.title)
        titleTextField.text = category.title
        typeTextField.text = category.type
        countLabel.text = "Count: \(category.count)"
    }

    override func customNavi() {
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneButtonTouchUpInside))
        navigationItem.rightBarButtonItem = doneButton
    }

    @objc func doneButtonTouchUpInside() {
        formatter.timeStyle = .medium
        formatter.dateStyle = .long
        let dateTimeString = formatter.string(from: currentDateTime)
        guard let title = titleTextField.text,
            let type = typeTextField.text else { return }
        //add new a item
        if isAdd {
            do {
                let realm = try Realm()
                let category = Category()
                category.title = title
                category.type = type
                category.count = 0
                category.date = dateTimeString
//                category.posts = 
                try realm.write {
                    realm.add(category)
                }

                self.navigationController?.popToRootViewController(animated: true)

            } catch {
                print("Lỗi thêm đối tượng vào Realm")
            }
        } else {
            do {
                if let category = category {
                    let realm = try Realm()
                    try realm.write {
                        category.title = title
                        category.type = type
                        category.date = dateTimeString
                    }
                    self.navigationController?.popToRootViewController(animated: true)
                }
            } catch {
                print("Lỗi edit đối tượng")
            }
        }
    }

    @IBAction func deleteButtonTouchUpInside(_ sender: Any) {
        let alert = UIAlertController(title: "Delete Item", message: "Are You Sure?", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Not Yet", style: UIAlertAction.Style.default, handler: { _ in
            //Cancel Action
        }))
        alert.addAction(UIAlertAction(title: "Yeah", style: UIAlertAction.Style.default, handler: { (_: UIAlertAction!) in
            do {
                if let category = self.category {
                    let realm = try Realm()
                    try realm.write {
                        realm.delete(category)
                    }
                    self.navigationController?.popToRootViewController(animated: true)
                }
            } catch {
                print("Failed Delete Item")
            }
        }))
        self.present(alert, animated: true, completion: nil)
    }
}
