//
//  AddPostViewController.swift
//  DemoRealm
//
//  Created by PhuocNguyen on 11/4/19.
//  Copyright © 2019 PhuocNguyen. All rights reserved.
//

import UIKit

protocol AddPostViewControllerDelegate: class {
    func addPostToRealm(post: Post, need perform: AddPostViewController.Action)
}

final class AddPostViewController: UIViewController {
    
    enum Action {
        case edit
        case add
    }
    
    @IBOutlet private weak var categoryLabel: UILabel!
    @IBOutlet private weak var contentTextView: UITextView!
    @IBOutlet private weak var titleTextField: UITextField!
    
    var action: Action = .add
    var postTitle: String?
    var postContent: String?
    var category: Category?
    
    weak var delegate: AddPostViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneCreate))
        contentTextView.text = postContent
        titleTextField.text = postTitle
    }
    
    @objc private func doneCreate() {
        guard let title = titleTextField.text, !title.isEmpty,
            let content = contentTextView.text, !content.isEmpty,
            let navi = navigationController else { return }
        let post = Post()
        post.title = title
        post.content = content
        for vc in navi.viewControllers where vc is CategoryViewController {
            //delegate?.addPostToRealm(post: post, need: action)
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
