//
//  PostDetailViewController.swift
//  BaiTap5Realm
//
//  Created by Sếp Quân on 4/22/20.
//  Copyright © 2020 QuanBT. All rights reserved.
//

import UIKit
import RealmSwift

protocol PostDetailViewControllerDelegate: class {
    func deletePost()
}

final class PostDetailViewController: UIViewController {
    // MARK: - IBOutlet
    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var contentLabel: UILabel!
    
    // MARK: - Properties
    var viewModel: PostDetailViewModel?
    weak var delegate: PostDetailViewControllerDelegate?
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    // MARK: - Function
    private func updateUI() {
        guard let viewModel = viewModel else { return }
        if viewModel.isFavorite {
            navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "star.fill"), style: .done, target: self, action: nil)
        } else {
            navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "star"), style: .done, target: self, action: nil)
        }
        title = viewModel.title
        dateLabel.text = viewModel.date.description
        contentLabel.text = viewModel.content
    }
    
    // MARK: - IBAction
    @IBAction private func editTouchUpInside(_ sender: Any) {
        let vc = AddPostViewController()
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
