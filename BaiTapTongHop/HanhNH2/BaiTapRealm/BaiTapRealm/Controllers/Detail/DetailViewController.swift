//
//  DetailViewController.swift
//  BaiTapRealm
//
//  Created by ANH NGUYỄN on 1/30/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

final class DetailViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    var viewModel = DetailViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
        setupNavigation()
    }

    func setupNavigation() {
        title = "Detail"
        let barButtonItem = UIBarButtonItem(image: UIImage(named: "ic-unfavorite"), style: .plain, target: self, action: #selector(handleFavoriteButton))
        navigationItem.rightBarButtonItem = barButtonItem
        barButtonItem.tintColor = .black
    }

    @objc func handleFavoriteButton() {

    }

    func configTableView() {
        tableView.register(name: CellIdentifier.detailTableViewCell.rawValue)
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension DetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.detailTableViewCell.rawValue, for: indexPath) as? DetailTableViewCell else { return UITableViewCell() }
        cell.viewModel = viewModel.makeCommentViewModel(at: indexPath)
        return cell
    }
}

extension DetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
