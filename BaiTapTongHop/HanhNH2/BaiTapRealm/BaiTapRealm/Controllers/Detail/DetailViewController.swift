//
//  DetailViewController.swift
//  BaiTapRealm
//
//  Created by ANH NGUYỄN on 1/30/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

final class DetailViewController: BaseViewController {

    @IBOutlet weak var tableView: UITableView!

    var viewModel = DetailViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    func updateUI() {
        configFavoriteButton()
        tableView.reloadData()
    }

    override func setupNavigation() {
        title = "Detail"
    }

    @objc func handleFavoriteButton() {
        viewModel.isFavorite { [weak self] (result) in
            guard let this = self else { return }
            switch result {
            case .success:
                this.updateUI()
            case .failure(let error):
                this.alert(title: error.localizedDescription)
            }
        }
    }

    func configFavoriteButton() {
        guard let repo = viewModel.repo else { return }
        var image: UIImage?
        if repo.isFavorite {
            image = UIImage(named: "ic-favorite")
        } else {
            image = UIImage(named: "ic-unfavorite")
        }
        let barButtonItem = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(handleFavoriteButton))
        navigationItem.rightBarButtonItem = barButtonItem
        barButtonItem.tintColor = .black
    }

    override func configUI() {
        super.configUI()
        tableView.register(name: CellIdentifier.detailTableViewCell.rawValue)
        tableView.dataSource = self
        tableView.delegate = self
    }

    override func configData() {
        super.configData()
        viewModel.loadFavoriteStatus { [weak self] (result) in
            guard let this = self else { return }
            switch result {
            case .success:
                this.configFavoriteButton()
            case .failure(let error):
                this.alert(title: error.localizedDescription)
            }
        }
    }
}

extension DetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.detailTableViewCell.rawValue, for: indexPath) as? DetailTableViewCell else { return UITableViewCell() }
        cell.viewModel = viewModel.viewModelForCell(at: indexPath)
        return cell
    }
}

extension DetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
