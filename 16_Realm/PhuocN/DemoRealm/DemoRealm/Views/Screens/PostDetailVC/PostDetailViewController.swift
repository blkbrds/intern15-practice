//
//  PostDetailViewController.swift
//  DemoRealm
//
//  Created by PhuocNguyen on 11/4/19.
//  Copyright © 2019 PhuocNguyen. All rights reserved.
//

import UIKit
import RealmSwift

protocol PostDetailViewControllerDelegate: class {
    func deletePost()
}

final class PostDetailViewController: UIViewController {
    
    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var contentLabel: UILabel!
    var viewModel: PostDetailViewModel?
    weak var delegate: PostDetailViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    private func updateUI() {
        guard let viewModel = viewModel else { return }
        if viewModel.isFavorite {
            navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "ic-like"), style: .done, target: self, action: nil)
        } else {
            navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "ic-dislike"), style: .done, target: self, action: nil)
        }
        title = viewModel.title
        dateLabel.text = viewModel.date.description
        contentLabel.text = viewModel.content
    }
    
    @IBAction private func editTouchUpInside(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(identifier: "AddPostVC") as AddPostViewController
        vc.action = .edit
        vc.title = "Edit post"
        vc.postTitle = viewModel?.title
        vc.postContent = viewModel?.content
        UserDefaults.standard.set(viewModel?.id, forKey: "PostIdEdit")
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction private func deleteTouchUpInside(_ sender: Any) {
        delegate?.deletePost()
        navigationController?.popViewController(animated: true)
    }
}
