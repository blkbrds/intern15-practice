//
//  GitFavoritesViewController.swift
//  API_MVVM_2
//
//  Created by PCI0002 on 6/9/20.
//  Copyright © 2020 LeThanhLam. All rights reserved.
//

import UIKit

final class GitFavoritesViewController: BaseViewController {

    //MARK: Properties
    @IBOutlet weak var tableView: UITableView!

    var viewModel = GitFavoritesViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        viewModel.setupObserve()
    }

    override func setUpUI() {
        registerTableView()
        configNavi()
    }

    override func setUpData() {

    }
    
    //MARK: Private Function
    private func registerTableView() {
        let nib = UINib(nibName: "GitFavoritesTableViewCell", bundle: .main)
        tableView.register(nib, forCellReuseIdentifier: "cell")
    }

    private func configNavi() {
        let imageDelete = UIImage(named: "trash")
        let backButton = UIBarButtonItem(image: imageDelete, style: .plain, target: self, action: #selector(deleteButtonTouchUpInside))
        navigationItem.leftBarButtonItem = backButton
    }

    @objc private func deleteButtonTouchUpInside() {
        viewModel.deleteAll { (done) in
            if done {
                self.fetchData()
            } else {
                print("Failed Delete All Object")
            }
        }
    }

    private func fetchData() {
        viewModel.fetchData { (done, error) in
            if done {
                self.updateUI()
            } else {
                print(error)
            }
        }
    }

    private func updateUI() {
        tableView.reloadData()
    }

}

//MARK: UITableViewDataSource, UITableViewDelegate
extension GitFavoritesViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! GitFavoritesTableViewCell
        cell.viewModel = viewModel.favoritesCell(at: indexPath)
        let item = viewModel.gits[indexPath.row]
        Downloader.shared().downloadImage(urlString: item.avatarURL) { (image) in
            if let image = image {
                cell.thumbnailImageView.image = image
            } else {
                cell.thumbnailImageView.image = nil
            }
        }
        return cell
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            self.viewModel.deleteOneObject(indexPath: indexPath) { (done, msg) in
                if done {
                    viewModel.gits.remove(at: indexPath.row)
                    tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
                } else {
                    print("Failed")
                }
            }
        }
    }
}

//MARK: GitCellDelegate
extension GitFavoritesViewController: GitFavoritesViewModelDelegate {
    func viewModel(_ viewModel: GitFavoritesViewModel, needperfomAction action: GitFavoritesViewModel.Action) {
        fetchData()
    }
}

