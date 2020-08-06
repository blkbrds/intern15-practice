//
//  HomeViewController.swift
//  BaitapRealm2
//
//  Created by ADMIN on 8/5/2563 BE.
//  Copyright © 2563 BE asiantech. All rights reserved.
//

import UIKit
import RealmSwift

class HomeViewController: BaseViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var viewModel = PostViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        viewModel.setupObserve()
    }
    
    func updateUI() {
        tableView.reloadData()
    }
    override func setupData() {
       fetchData()
    }
    
    override func setupUI() {
        title = "Category"
        customNavi()
        let nib = UINib(nibName: "CategoryTableViewCell", bundle: .main)
        tableView.register(nib, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
    }
    override func customNavi() {
        let backButton = UIBarButtonItem(barButtonSystemItem: .undo, target: self, action: #selector(backButtonTouchUpInside))
        navigationItem.leftBarButtonItem = backButton
        
        let editButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(editButtonTouchUpInside))
        navigationItem.rightBarButtonItem = editButton
        
    }
    @objc func backButtonTouchUpInside() {
        
    }
    @objc func editButtonTouchUpInside() {
        
    }
    func addPost(title: String, content: String,date: String, isFavorite: Bool ) {
        let realm = try! Realm()
        
        let post = Post()
        post.title = title
        post.content = content
        post.createDate = date
        post.isFavorite = isFavorite
        
        try! realm.write {
            realm.add(post)
        }
    }
    @IBAction func addNewPostButtonTouchUpInside(_ sender: Any) {
        let addPost = AddPostViewController()
        addPost.isAdd = true
        self.navigationController?.pushViewController(addPost, animated: true)
    }
    
    private func fetchData() {
        viewModel.fetchData { (done) in
            if done {
                self.updateUI()
            } else {
                print("Failed Fetch Data")
            }
        }
    }
    
    func deleteData() {
        viewModel.deleteAll { (done) in
            if done {
                self.fetchData()
            } else {
                print("Failed Delete ALL DATA")
            }
        }
    }

}
extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberPost()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CategoryTableViewCell else {return UITableViewCell() }
        let post = viewModel.postIndex(at: indexPath)
        cell.contentLabel.text = post.content
        cell.dateTimeLabel.text = post.createDate
        cell.titleLabel.text = post.title
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let post = viewModel.postIndex(at: indexPath)
        let detailPost = DetailPostViewController()
        detailPost.titlePost = post.title
        detailPost.detailContentPost = post.content
        detailPost.detailDatePost = post.createDate
        detailPost.post = viewModel.postIndex(at: indexPath)
        self.navigationController?.pushViewController(detailPost, animated: true )
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = UIContextualAction(style: .normal, title: "Delete") { (action, view, completionHandle) in
            self.viewModel.posts.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            completionHandle(true)
        }
        let swipe = UISwipeActionsConfiguration(actions: [delete])
        return swipe
    }

}
extension HomeViewController: HomeViewModelDelegate {
    func viewModel(_ viewModel: PostViewModel, needPerformAction action: PostViewModel.Action) {
        fetchData()
    }
}

extension HomeViewController: CategoryTableViewCellDelegate {
    func cell(_ cell: CategoryTableViewCell, needPerforms action: CategoryTableViewCell.Action) {
        guard let indexPath = tableView.indexPath(for: cell) else { return }
        viewModel.posts[indexPath.row].isFavorite = true
    }
}
