//
//  FavoritesViewController.swift
//  BaiTapTongHop
//
//  Created by PCI0018 on 11/25/19.
//  Copyright © 2019 Asian Tech. All rights reserved.
//

import UIKit
import RealmSwift

final class FavoritesViewController: ViewController {

    //MARK: - Properties
    @IBOutlet private weak var tableView: UITableView!

    private var refreshControl = UIRefreshControl()
    private let cellRegister: String = "HomeCell"
    private var notificationToken: NotificationToken?

    var viewModel = FavoritesViewModel()

    // MARK: - Life Cycle
    override func setupUI() {
        super.setupUI()
        title = "Favorites"
        setupTableView()
        changeValueFromRealm()
    }

    override func setupData() {
        super.setupData()
        fetchData()
    }

    deinit {
        notificationToken?.invalidate()
    }
}

// MARK: - Setup UI conform
extension FavoritesViewController {

    private func setupTableView() {
        // Setup refresh control
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        refreshControl.attributedTitle = NSAttributedString(string: "Fetching")
        refreshControl.tintColor = .systemPink
        refreshControl.alpha = 0.8

        tableView.register(UINib(nibName: cellRegister, bundle: .main), forCellReuseIdentifier: cellRegister)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.refreshControl = refreshControl
    }
    
    private func updateUI() {
        if viewModel.getNumberOfFavoritedPlace() == 0 {
            tableView.alpha = 0
        } else {
            tableView.alpha = 1
        }
        
        if viewModel.getNumberOfFavoritedPlace() != 0 {
            let removeAllButton = UIBarButtonItem(image: #imageLiteral(resourceName: "icons8-remove-50.png"), style: .plain, target: self, action: #selector(removeAll))
            navigationItem.rightBarButtonItem = removeAllButton
        } else {
            navigationItem.rightBarButtonItem = nil
        }
        tableView.reloadData()
    }
}

// MARK: - Setup data
extension FavoritesViewController {

    @objc private func fetchData() {
        viewModel.getFavoritedPlace(isRefresh: false) { [weak self] in
            guard let this = self else { return }
            this.refreshControl.endRefreshing()
            this.tableView.reloadData()
        }
    }

    @objc private func refresh() {
        viewModel.getFavoritedPlace(isRefresh: true) { [weak self] in
            guard let this = self else { return }
            this.refreshControl.endRefreshing()
            this.tableView.reloadData()
        }
    }

    @objc private func removeAll() {
        let okButton = UIAlertAction(title: "OK", style: .default) { (action) in
            self.viewModel.removeAll { (done, error) in
                if !done {
                    self.alert(msg: error, handler: nil)
                }
                self.tableView.alpha = 0
            }
        }
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let alert = UIAlertController(title: App.Home.alertTitle, message: "Do you want to delete all?", preferredStyle: .alert)
        alert.addAction(okButton)
        alert.addAction(cancelButton)
        present(alert, animated: true, completion: nil)
    }
}

// MARK: - Notification
extension FavoritesViewController {

    private func changeValueFromRealm() {
        let result = RealmManager.shared.realm.objects(Favorites.self)
        notificationToken = result.observe({ [weak self] (changes: RealmCollectionChange) in
            guard let self = self else { return }
            switch changes {
            case .initial:
                self.updateUI()
            case .update:
                self.viewModel.getFavoritedPlace(isRefresh: true) {
                    self.updateUI()
                }
            case .error(let error):
                self.alert(msg: error.localizedDescription, handler: nil)
            }
        })
    }
}

// MARK: - Table View Delegate, Datasource
extension FavoritesViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getNumberOfFavoritedPlace()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellRegister, for: indexPath) as? HomeCell else { return UITableViewCell() }
        cell.viewModel = viewModel.getFavoritesCellViewModel(indexPath: indexPath)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewController()
        vc.viewModel = viewModel.getDetailViewModel(indexPath: indexPath)
        navigationController?.pushViewController(vc, animated: true)
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let okButton = UIAlertAction(title: "OK", style: .default) { (action) in
                self.viewModel.removePlace(indexPath: indexPath) { (_, _) in }
            }
            let cancelButton = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            let alert = UIAlertController(title: App.Home.alertTitle, message: App.Home.alertMessage, preferredStyle: .alert)
            alert.addAction(okButton)
            alert.addAction(cancelButton)
            present(alert, animated: true, completion: nil)
        }
    }
}
