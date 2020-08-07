//
//  AddPostViewController.swift
//  BaitapRealm2
//
//  Created by ADMIN on 8/5/2563 BE.
//  Copyright © 2563 BE asiantech. All rights reserved.
//

import UIKit
import RealmSwift

class AddPostViewController: BaseViewController {
    
    @IBOutlet weak var titlePostTextField: UITextField!
    @IBOutlet weak var contentPostTextView: UITextView!
    
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
        title = status ? titleAddPost : editPost
        titlePostTextField.text = titlePost
        contentPostTextView.text = detailContentPost
        contentPostTextView.clipsToBounds = true
        contentPostTextView.layer.borderWidth = 2
        contentPostTextView.layer.cornerRadius = 10
        
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
        guard let title = titlePostTextField.text, let content = contentPostTextView.text else { return }
        if status {
            do {
                let realm = try Realm()
                let post = Post()
                post.title = title
                post.content = content
                post.createDate = dateTimeString
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
                        post.createDate = dateTimeString
                    }
                    self.navigationController?.popToRootViewController(animated: true)
                }
            } catch {
                print("Lỗi edit đối tượng")
            }
        }
    }
}
