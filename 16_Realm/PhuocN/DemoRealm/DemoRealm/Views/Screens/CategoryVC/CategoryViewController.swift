//
//  CategoryViewController.swift
//  DemoRealm
//
//  Created by PhuocNguyen on 11/4/19.
//  Copyright © 2019 PhuocNguyen. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: CategoryViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        title = viewModel?.category.name
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    @IBAction func addPostTouchUpInside(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(identifier: "AddPostVC") as AddPostViewController
        //vc.viewModel = CategoryViewModel(category: viewModel.getCategory(at: indexPath))
        vc.delegate = self
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension CategoryViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.getCount() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath) as? CategoryTableViewCell,
            let viewModel = viewModel else { fatalError("NO Have cell") }
        cell.configUI(post: viewModel.getPost(in: indexPath))
        return cell
    }
}

extension CategoryViewController: AddPostViewControllerDelegate {
    func addPostToRealm(post: Post) {
        guard let viewModel = viewModel else { return }
        try! RealmManager.shared.realm?.write {
            viewModel.category.posts.append(post)
        }
        tableView.reloadData()
    }
    
    
}
