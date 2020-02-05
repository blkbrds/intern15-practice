//
//  FavoriteViewController.swift
//  BaiTapRealm
//
//  Created by ANH NGUYỄN on 1/22/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

final class FavoriteViewController: BaseViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!

    var viewModel = FavoriteViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        viewModel.setupObserver()
    }

    @objc func deleteAll() {
        let alertButton = UIAlertAction(title: Strings.ok, style: .default) { (action) in
            self.viewModel.removeAllFavoriteRepo { [weak self] (result) in
                guard let this = self else { return }
                switch result {
                case .success:
                    this.fetchData()
                case .failure:
                    this.alert(title: Errors.cannotDeleteError.localizedDescription)
                }
            }
        }
        let cancelButton = UIAlertAction(title: Strings.cancel, style: .cancel, handler: nil)
        let alert = UIAlertController(title: Strings.warning, message: Strings.removeAll, preferredStyle: .alert)
        alert.addAction(alertButton)
        alert.addAction(cancelButton)
        present(alert, animated: true, completion: nil)
    }

    override func configUI() {
        super.configUI()
        title = Strings.favorite
        let barButtonItem = UIBarButtonItem(image: UIImage(named: "ic-delete"), style: .plain, target: self, action: #selector(deleteAll))
        navigationItem.rightBarButtonItem = barButtonItem
        barButtonItem.tintColor = .black
        
        tableView.register(name: CellIdentifier.favoriteCell.rawValue)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.dataSource = self
        tableView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(dissmissKeyboard)))
        
        searchBar.delegate = self
    }

    override func configData() {
        super.configData()
        fetchData()
    }

    func fetchData() {
        viewModel.fetchData(completion: { [weak self] (result) in
            guard let this = self else { return }
            switch result {
            case .success:
                this.tableView.reloadData()
            case .failure(let error):
                this.alert(title: error.localizedDescription)
            }
        })
    }
    
    @objc private func dissmissKeyboard() {
        view.endEditing(true)
    }
}

extension FavoriteViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection(in: section)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.favoriteCell.rawValue, for: indexPath) as? FavoriteCell else { return UITableViewCell() }
        cell.indexPath = indexPath
        cell.delegate = self
        cell.viewModel = viewModel.viewModelForCell(at: indexPath)
        return cell
    }
}

extension FavoriteViewController: FavoriteCellDelegate {
    func getImage(cell: FavoriteCell, needPerform action: FavoriteCell.Action) {
        switch action {
        case .getImageCollection(let indexPath):
            if let indexPath = indexPath {
                viewModel.downloadImage(indexPath: indexPath) { [weak self] (image) in
                    guard let this = self else { return }
                    if this.tableView.indexPathsForVisibleRows?.contains(indexPath) == true {
                        this.tableView.reloadRows(at: [indexPath], with: .none)
                    }
                }
            }
        }
    }
}

extension FavoriteViewController: FavoriteViewModelDelegate {
    func viewModel(_viewModel: FavoriteViewModel, needperfomAction action: FavoriteViewModel.Action) {
        switch action {
        case .reloadData:
            fetchData()
        }
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            viewModel.unfavorite(at: indexPath) { [weak self] (result) in
                guard let this = self else { return }
                switch result {
                case .success:
                    this.tableView.reloadData()
                case .failure:
                    this.alert(title: Errors.cannotDeleteError.localizedDescription)
                }
            }
        }
    }
}

extension FavoriteViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.search(text: searchText) { [weak self] (result) in
            guard let this = self else { return }
            switch result {
            case .success:
                this.tableView.reloadData()
            case .failure(let error):
                this.alert(title: error.localizedDescription)
            }
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        fetchData()
    }
}

