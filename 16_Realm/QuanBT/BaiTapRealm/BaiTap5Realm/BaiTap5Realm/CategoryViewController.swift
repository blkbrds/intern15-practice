//
//  CategoryViewController.swift
//  BaiTap5Realm
//
//  Created by Sếp Quân on 4/22/20.
//  Copyright © 2020 QuanBT. All rights reserved.
//

import UIKit
import RealmSwift

final class CategoryViewController: UIViewController {
    // MARK: - IBOutlet
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    var viewModel: CategoryViewModel?
    var notificationToken: NotificationToken?
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        changeValueOfRealm()
    }
    
    // MARK: - Function
    private func changeValueOfRealm() {
        let results = RealmManager.shared.realm?.objects(Post.self)
        notificationToken = results?._observe({ [weak self] (changes: RealmCollectionChange) in
            guard let tableView = self?.tableView else { return }
            switch changes {
            case .initial:
                tableView.reloadData()
            case .update(_, let deletions, let insertions, let modifications):
                tableView.beginUpdates()
                if !deletions.isEmpty, let index = tableView.indexPathForSelectedRow {
                    tableView.deleteRows(at: [index], with: .automatic)
                }
                if !modifications.isEmpty, let index = tableView.indexPathForSelectedRow {
                    tableView.reloadRows(at: [index], with: .automatic)
                }
                if !insertions.isEmpty {
                    tableView.insertRows(at: [IndexPath(row: tableView.numberOfRows(inSection: 0), section: 0)], with: .automatic)
                }
                tableView.endUpdates()
            case .error(let error):
                fatalError("\(error)")
            }
        })
    }
    
    private func setupUI() {
        title = viewModel?.category.title
        let nib = UINib(nibName: "CategoryTableViewCell", bundle: .main)
        tableView.register(nib, forCellReuseIdentifier: "CategoryTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 100
    }
    
    // MARK: - IBAction
    @IBAction private func addPostTouchUpInside(_ sender: Any) {
        let vc = AddPostViewController()
        vc.action = .add
        vc.delegate = self
        vc.title = "Add post"
        vc.category = viewModel?.category
        navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension CategoryViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.getCount() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryTableViewCell", for: indexPath) as? CategoryTableViewCell,
            let viewModel = viewModel else { fatalError("NO Have cell") }
        cell.configUI(post: viewModel.getPost(in: indexPath))
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let viewModel = viewModel else { return }
        let vc = PostDetailViewController()
        vc.delegate = self
        vc.viewModel = PostDetailViewModel(post: viewModel.getPost(in: indexPath))
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
}

// MARK: - AddPostViewControllerDelegate
extension CategoryViewController: AddPostViewControllerDelegate {
    func addPostToRealm(post: Post, need: AddPostViewController.Action) {
        guard let category = viewModel?.category else { return }
        RealmManager.shared.writeObject(action: {
            category.posts.append(post)
        }) { (result) in
            switch result {
            case .sucessful:
                self.tableView.insertRows(at: [IndexPath(row: self.tableView.numberOfRows(inSection: 0), section: 0)], with: .automatic)
            case .failture(let err):
                print(err)
            }
        }
    }
}

// MARK: - PostDetailViewControllerDelegate
extension CategoryViewController: PostDetailViewControllerDelegate {
    func deletePost() {
        guard let index = tableView.indexPathForSelectedRow, let viewModel = viewModel else { return }
        RealmManager.shared.deleteObject(with: viewModel.getPost(in: index))
    }
}
