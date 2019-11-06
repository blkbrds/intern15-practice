//
//  FavoriteViewController.swift
//  abc
//
//  Created by PhuocNguyen on 10/22/19.
//  Copyright © 2019 PhuocNguyen. All rights reserved.
//

import UIKit
import RealmSwift

class FavoriteViewController: BaseViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    enum Action {
        case remove
        case removeAll
    }
    
    var viewModel = FavoriteViewModel()
    var notificationToken: NotificationToken?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        changeVideoValueFromRealm()
    }
    
    func changeVideoValueFromRealm() {
        let result = RealmManager.shared.realm.objects(Video.self)
        notificationToken = result.observe({ [weak self] (changes: RealmCollectionChange) in
            guard let self = self else { return }
            switch changes {
            case .initial:
                self.tableView.reloadData()
            case .update(_, _, _, _):
                self.viewModel.fetchDataFromRealm { (done) in
                    if !done {
                        // show alert and return
                    }
                }
                self.tableView.reloadData()
            case .error(let error):
                fatalError("\(error)")
            }
        })
    }
    
    override func setupUI() {
        tableView.register(withNib: FavoriteTableViewCell.self)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView(frame: .zero)
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: #selector(deleteAllFavoriteVideo))
    }
    
    override func loadData() {
        viewModel.fetchDataFromRealm { [weak self] (done) in
            guard let self = self else { return }
            if done {
                self.tableView.reloadData()
            } else {
                // show alert
            }
        }
    }
    
    @objc private func deleteAllFavoriteVideo() {
        showAlert(title: "Warning", mess: "Do you want to delete all your favorite", need: .removeAll)
    }
    
    func showAlert(title: String, mess: String, need perform: Action, index: Int = 0) {
        let alert = UIAlertController(title: title, message: mess, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
            switch perform {
            case .remove:
                self.viewModel.deleteLikeVideo(index: index) { (done) in
                    if !done {
                        print("Can no delete form realm")
                    }
                }
            case .removeAll:
                self.viewModel.deleteAllLikeVideo { (done) in
                    if !done {
                        print("Can no delete from realm")
                    }
                }
            }
        }
        alert.addAction(cancelAction)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    deinit {
        self.notificationToken?.invalidate()
    }
}

extension FavoriteViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(with: FavoriteTableViewCell.self, indexPath: indexPath)
        cell.titleLabel.text = viewModel.getVideo(at: indexPath.row).title
        cell.channelLabel.text = viewModel.getVideo(at: indexPath.row).channel
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.showAlert(title: "Warning", mess: "Do you want to remove this like", need: .remove, index: indexPath.row)
        }
    }
}
