//
//  FavoriteViewController.swift
//  BaiTapTongHop
//
//  Created by ANH NGUYỄN on 1/6/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

final class FavoriteViewController: BaseViewController {

    @IBOutlet weak var tableView: UITableView!

    var viewModel = FavoriteViewMoel()

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        viewModel.delegate = self
        viewModel.setupObserve()
        configTableView()
    }

    override func setupNavigation() {
        title = "Favorite"
        if viewModel.getNumberOfFavoritedPlace() != 0 {
            let removeAllButton = UIBarButtonItem(image: #imageLiteral(resourceName: "ic-delete"), style: .plain, target: self, action: #selector(removeAllFavoriteUser))
            navigationItem.rightBarButtonItem = removeAllButton
            removeAllButton.tintColor = .black
        } else {
            navigationItem.rightBarButtonItem = nil
        }
        tableView.reloadData()
    }
    
    @objc func removeAll() {
        let alertButton = UIAlertAction(title: "OK", style: .default) { (action) in
            self.viewModel.removeAllFavoriteUser { (result) in
                switch result {
                case .failure(let error):
                    self.alert(title: error.localizedDescription)
                case .success:
                    self.alert(title: Strings.removeAllSuccess)
                }
            }
        }
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let alert = UIAlertController(title: Strings.ok, message: Strings.removeAll, preferredStyle: .alert)
        alert.addAction(alertButton)
        alert.addAction(cancelButton)
        present(alert, animated: true, completion: nil)
    }

    private func configTableView() {
        tableView.register(name: CellIdentifier.homeTableViewCell.rawValue)
        tableView.dataSource = self
        tableView.delegate = self
    }

    private func fetchData() {
        viewModel.loadDataForFavorite { (reslut) in
            switch reslut {
            case .success(_):
                tableView.reloadData()
            case .failure(let error):
                self.alert(title: error.localizedDescription)
            }
        }
    }
}
extension FavoriteViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows(in: section)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.homeTableViewCell.rawValue, for: indexPath) as! HomeTableViewCell
        cell.viewModel = viewModel.viewModelForItems(at: indexPath)
        return cell
    }
}

extension FavoriteViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let alertButton = UIAlertAction(title: "OK", style: .default) { (action) in
                self.viewModel.unfavoriteUser(at: indexPath) { (reslut) in
                    switch reslut {
                    case .success:
                        self.alert(title: Strings.removeAProgramSuccess)
                    case .failure(let error):
                        self.alert(title: error.localizedDescription)
                    }
                }
            }
            let cancelButton = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            let alert = UIAlertController(title: Strings.ok, message: Strings.removeAProgram, preferredStyle: .alert)
            alert.addAction(alertButton)
            alert.addAction(cancelButton)
            present(alert, animated: true, completion: nil)
        }
    }
}

extension FavoriteViewController: FavoriteViewModelDelegate {
    func viewModel(_viewModel _: FavoriteViewMoel, needperfomAction action: FavoriteViewMoel.Action) {
        fetchData()
    }
}
