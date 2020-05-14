//
//  AddCategoryViewController.swift
//  BaiTapRealm
//
//  Created by PCI0002 on 5/6/20.
//  Copyright © 2020 LeThanhLam. All rights reserved.
//

import UIKit
import RealmSwift

class AddCategoryViewController: BaseViewController {

    // MARK: - IBOutlet
    @IBOutlet private weak var titleTextField: UITextField!
    @IBOutlet private weak var countLabel: UILabel!
    @IBOutlet private weak var typeTextField: UITextField!
    @IBOutlet weak var deleteItemButton: UIButton!

    // MARK: - Properties
    var titleName: String = ""
    var typeName: String = ""
    var count: String = ""
    var isAdd = false
    var music: Music?
    let curentDate = NSDate()
    let dateFormatter = DateFormatter()
    let currentDateTime = Date()
    let formatter = DateFormatter()

    override func viewDidLoad() {
        super.viewDidLoad()
        print(music)
    }

    // MARK: -
    override func setUpUI() {
        title = isAdd ? "Add Category" : "Edit Category"
        titleTextField.text = titleName
        countLabel.text = "Count: \(count)"
        typeTextField.text = typeName
        customNavi()
        deleteItemButton.isHidden = isAdd
    }

    // MARK: - Private Function
    private func customNavi() {
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(done))
        navigationItem.rightBarButtonItem = doneButton
    }

    @objc func done() {
        formatter.timeStyle = .medium
        formatter.dateStyle = .long
        let dateTimeString = formatter.string(from: currentDateTime)
        guard let title = titleTextField.text,
            let type = typeTextField.text else { return }
        if isAdd {
            //add new a item
            do {
                let realm = try Realm()
                let music = Music()
                music.title = title
                music.type = type
                music.count = 0
                music.date = dateTimeString
                try realm.write {
                    realm.add(music)
                }

                self.navigationController?.popViewController(animated: true)

            } catch {
                print("Lỗi thêm đối tượng vào Realm")
            }

        } else {
            //edit item
            do {
                if let music = music {
                    let realm = try Realm()
                    try realm.write {
                        music.title = title
                        music.type = type
                        music.date = dateTimeString
                    }
                    self.navigationController?.popViewController(animated: true)
                }
            } catch {
                print("Lỗi edit đối tượng")
            }
        }
    }

    // MARK: -IBAction
    @IBAction func deleteButtonTouchUpInside(_ sender: Any) {
        let alert = UIAlertController(title: "Delete Item", message: "Are You Sure?", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Not Yet", style: UIAlertAction.Style.default, handler: { _ in
            //Cancel Action
        }))
        alert.addAction(UIAlertAction(title: "Yeah", style: UIAlertAction.Style.default, handler: { (_: UIAlertAction!) in
            do {
                if let music = self.music {
                    let realm = try Realm()
                    try realm.write {
                        realm.delete(music)
                    }
                    self.navigationController?.popViewController(animated: true)
                }
            } catch {
                print("Failed Delete Item")
            }
        }))
        self.present(alert, animated: true, completion: nil)
    }
}
