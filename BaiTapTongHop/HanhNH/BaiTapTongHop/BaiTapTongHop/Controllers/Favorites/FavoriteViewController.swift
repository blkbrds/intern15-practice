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
        configTableView()
        fetchData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        fetchData()
    }

    override func setupNavigation() {
        title = "Favorite"
    }

    private func configTableView() {
        tableView.register(name: CellIdentifier.homeTableViewCell.rawValue)
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func fetchData() {
        viewModel.loadDataForForFavorite { (reslut) in
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
        cell.viewModel = viewModel.ViewModelForFavorite(at: indexPath)
        return cell
    }
}

extension FavoriteViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}




