//
//  FavoritesViewController.swift
//  BaiTapTongHop
//
//  Created by PCI0002 on 6/11/20.
//  Copyright © 2020 LeThanhLam. All rights reserved.
//

import UIKit
import RealmSwift

final class FavoritesViewController: BaseViewController {

    //MARK: Properties
    var viewModel = FavoritesViewModel()
    @IBOutlet weak var tableView: UITableView!

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
        fetchData()
    }

    //MARK: Private Functions
    private func configNavi() {
        title = "Repositoríes Favorites"
        let imageDelete = UIImage(named: "trash")
        let backButton = UIBarButtonItem(image: imageDelete, style: .plain, target: self, action: #selector(deleteButtonTouchUpInside))
        navigationItem.leftBarButtonItem = backButton
    }

    private func registerTableView() {
        let nib = UINib(nibName: "FavoritesCell", bundle: .main)
        tableView.register(nib, forCellReuseIdentifier: "cell")
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

    @objc func deleteButtonTouchUpInside() {
        viewModel.deleteAll { (done) in
            if done {
                self.fetchData()
            } else {
                print("Failed Delete All Object")
            }
        }
    }

    private func updateUI() {
        tableView.reloadData()
    }
}

//MARK: UITableViewDelegate, UITableViewDataSource
extension FavoritesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection()
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return viewModel.heightForRowAt()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FavoritesCell
        cell.viewModel = viewModel.favoritesCell(at: indexPath)
        let item = viewModel.repos[indexPath.row]
        Downloader.shared().downloadImage(urlString: item.imageURL) { (image) in
            if let image = image {
                cell.favoriteImageView.image = image
            } else {
                cell.favoriteImageView.image = nil
            }
        }
        return cell
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            self.viewModel.deleteOneObject(indexPath: indexPath) { (done, msg) in
                if done {
                    viewModel.repos.remove(at: indexPath.row)
                    tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
                } else {
                    print("Failed")
                }
            }
        }
    }
}
extension FavoritesViewController: FavoritesViewModelDelegate {
    func viewModel(_ viewModel: FavoritesViewModel, needperfomAction action: FavoritesViewModel.Action) {
        fetchData()
    }
}
