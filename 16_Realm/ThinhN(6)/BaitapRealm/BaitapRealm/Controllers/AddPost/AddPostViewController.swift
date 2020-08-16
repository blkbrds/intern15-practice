//
//  AddPostViewController.swift
//  BaitapRealm
//
//  Created by ADMIN on 8/15/2563 BE.
//  Copyright © 2563 BE asiantech. All rights reserved.
//

import UIKit
import RealmSwift

class AddPostViewController: BaseViewController {
    
    @IBOutlet weak var titlePostTextField: UITextField!
    @IBOutlet weak var contentPostTextField: UITextField!
    
    var status = false
    var post: Post?
    let formatter = DateFormatter()
    var detailContentPost: String = ""
    var titlePost: String = ""
    let titleAddPost: String = "Add Post"
    let editPost: String = "Edit Post"
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func setupUI() {
        title = "Add Post"
       // title = status ? titleAddPost : editPost
        titlePostTextField.text = titlePost
        contentPostTextField.text = detailContentPost
        contentPostTextField.clipsToBounds = true
        contentPostTextField.layer.borderWidth = 2
        contentPostTextField.layer.cornerRadius = 10
    }
    
    override func customNavi() {
        let backButton = UIBarButtonItem(barButtonSystemItem: .cancel , target: self, action: #selector(backButtonTouchUpInside))
        navigationItem.leftBarButtonItem = backButton
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(doneButtonTouchUpInside))
        navigationItem.rightBarButtonItem = doneButton
    }
    
    @objc func backButtonTouchUpInside() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func doneButtonTouchUpInside() {
        formatter.timeStyle = .medium
        formatter.dateStyle = .medium
        let dateTimeString = formatter.string(from: Date())
        guard let title = titlePostTextField.text, let content = contentPostTextField.text else { return }
        if status {
            do {
                let realm = try Realm()
                let post = Post()
                post.title = title
                post.content = content
                post.createdDate = dateTimeString
                post.isFavorite = false
                try realm.write {
                    realm.add(post)
                }
                self.navigationController?.popViewController(animated: true)
            } catch {
                print("Lỗi thêm đối tượng vào Realm")
            }
        } else {
            do {
                if let post = post {
                    let realm = try Realm()
                    try realm.write {
                        post.title = title
                        post.content = content
                        post.createdDate = dateTimeString
                    }
                    self.navigationController?.popToRootViewController(animated: true)
                }
            } catch {
                print("Lỗi edit đối tượng")
            }
        }
    }
}


