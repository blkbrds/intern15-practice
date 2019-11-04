//
//  AddPostViewController.swift
//  DemoRealm
//
//  Created by PhuocNguyen on 11/4/19.
//  Copyright © 2019 PhuocNguyen. All rights reserved.
//

import UIKit

protocol AddPostViewControllerDelegate: class {
    func addPostToRealm(post: Post)
}

class AddPostViewController: UIViewController {
    
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var contentTextView: UITextView!
    @IBOutlet weak var titleTextField: UITextField!
    
    weak var delegate: AddPostViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        title = "Add Post"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneCreate))
    }
    
    @objc private func doneCreate() {
        guard let title = titleTextField.text, !title.isEmpty,
            let content = contentTextView.text, !content.isEmpty else { return }
        let post = Post()
        post.title = title
        post.content = content
        delegate?.addPostToRealm(post: post)
        navigationController?.popViewController(animated: true)
    }
    
}
