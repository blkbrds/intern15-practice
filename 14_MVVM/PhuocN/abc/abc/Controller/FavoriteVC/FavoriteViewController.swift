//
//  FavoriteViewController.swift
//  abc
//
//  Created by PhuocNguyen on 10/22/19.
//  Copyright © 2019 PhuocNguyen. All rights reserved.
//

import UIKit
import RealmSwift

final class FavoriteViewController: BaseViewController {
    
    //MARK: -IBOulet
    @IBOutlet private weak var tableView: UITableView!
    
    enum Action {
        case remove
        case removeAll
    }
    
    //MARK: -Properties
    var viewModel = FavoriteViewModel()
    private var notificationToken: NotificationToken?
    
    //MARK: -lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        changeVideoValueFromRealm()
    }
    
    //MARK: -config
    override func setupUI() {
        super.setupUI()
        tableView.register(withNib: FavoriteTableViewCell.self)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView(frame: .zero)
        navigationItem.rightBarButtonItems! += [UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: #selector(deleteAllFavoriteVideo))]
    }
    
    override func loadData() {
        viewModel.fetchDataFromRealm { [weak self] (done) in
            guard let self = self else { return }
            if done {
                self.tableView.reloadData()
            } else {
                self.showErrorAlert(with: "Can not load favorite videos")
            }
        }
    }
    
    //MARK: -private func
    private func changeVideoValueFromRealm() {
        let result = RealmManager.shared.realm.objects(PlayList.self)
        notificationToken = result.observe({ [weak self] (changes: RealmCollectionChange) in
            guard let self = self else { return }
            switch changes {
            case .initial:
                self.tableView.reloadData()
            case .update(_, let deletions, let insertions, _):
                self.viewModel.fetchDataFromRealm { (done) in
                    if done {
                        self.tableView.applyChange(insertions: insertions, deletions: deletions)
                    }
                }
            case .error(let error):
                fatalError("\(error)")
            }
        })
    }
    
    @objc private func deleteAllFavoriteVideo() {
        showAlert(title: "Warning", mess: "Do you want to delete all your favorite", need: .removeAll)
    }
    
    //MARK: -alert action
    override func showErrorAlert(with mess: String) {
        let alert = UIAlertController(title: "Error", message: mess, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    private func showAlert(title: String, mess: String, need perform: Action, index: Int = 0) {
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

//MARK: -tableview delegate, datasource
extension FavoriteViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(with: FavoriteTableViewCell.self, indexPath: indexPath)
        cell.titleLabel.text = viewModel.getPlayList(at: indexPath.row).title
        cell.channelLabel.text = viewModel.getPlayList(at: indexPath.row).channel
        cell.videoImageView.setImageWith(urlString: viewModel.getPlayList(at: indexPath.row).imageURL, index: indexPath.row)
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
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = DetailViewController()
        detailVC.viewModel = DetailViewModel(video: viewModel.getPlayList(at: indexPath.row).convertToVideo())
        present(detailVC, animated: true, completion: nil)
    }
}
