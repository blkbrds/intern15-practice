//
//  AddPostViewController.swift
//  BaiTap5Realm
//
//  Created by Sếp Quân on 4/22/20.
//  Copyright © 2020 QuanBT. All rights reserved.
//

import UIKit

protocol AddPostViewControllerDelegate: class {
    func addPostToRealm(post: Post, need perform: AddPostViewController.Action)
}

final class AddPostViewController: UIViewController {
    // MARK: - Enum
    enum Action {
        case edit
        case add
    }
    
    // MARK: - IBOutlet
    @IBOutlet private weak var categoryLabel: UILabel!
    @IBOutlet weak var contentTextView: UITextField!
    @IBOutlet private weak var titleTextField: UITextField!
    
    // MARK: - Properties
    var action: Action = .add
    var postTitle: String?
    var postContent: String?
    var category: Category?
    
    weak var delegate: AddPostViewControllerDelegate?
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Function
    private func setupUI() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneCreate))
        contentTextView.text = postContent
        titleTextField.text = postTitle
        categoryLabel.text = category?.title
    }
    
    @objc private func doneCreate() {
        guard let title = titleTextField.text, !title.isEmpty,
            let content = contentTextView.text, !content.isEmpty,
            let navi = navigationController else { return }
        let post = Post()
        post.title = title
        post.content = content
        for vc in navi.viewControllers where vc is CategoryViewController {
            switch action {
            case .add:
                if let category = category {
                    RealmManager.shared.writeObject (action: {
                        category.posts.append(post)
                    })
                }
            case .edit:
                if let postId = UserDefaults.standard.value(forKey: "PostIdEdit") as? String,
                    let post = RealmManager.shared.realm?.objects(Post.self).filter({ $0.id == postId }).first,
                    post.title != title || post.content != content {
                    RealmManager.shared.writeObject(action: {
                        post.title = title
                        post.content = content
                    })
                }
                
            }
            navi.popToViewController(vc, animated: true)
        }
    }
}

