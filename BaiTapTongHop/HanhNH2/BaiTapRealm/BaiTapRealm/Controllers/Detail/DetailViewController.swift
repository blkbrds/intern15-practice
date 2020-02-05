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

    var viewModel: DetailViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.delegate = self
        viewModel?.setupObserver()
    }

    func updateUI() {
        configFavoriteButton()
        tableView.reloadData()
    }

    @objc func handleFavoriteButton() {
        viewModel?.handleFavoriteRepo { [weak self] (result) in
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
        guard let repo = viewModel?.repo else { return }
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

    override func setupUI() {
        super.setupUI()
        title = Strings.detail
        tableView.register(name: CellIdentifier.detailTableViewCell.rawValue)
        tableView.dataSource = self
        tableView.delegate = self
    }

    override func setupData() {
        super.setupData()
        fetchData()
    }
    
    func fetchData() {
        viewModel?.loadFavoriteStatus { [weak self] (result) in
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
        guard let viewModel = viewModel else { return 0 }
        return viewModel.numberOfRowsInSection()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.detailTableViewCell.rawValue, for: indexPath) as? DetailTableViewCell else { return UITableViewCell() }
        cell.indexPath = indexPath
        cell.delagate = self
        cell.viewModel = viewModel?.viewModelForCell(at: indexPath)
        return cell
    }
}

extension DetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension DetailViewController: DetailViewModelDelegate {
    func viewModel(_viewModel: DetailViewModel, needperfomAction action: DetailViewModel.Action) {
        switch action {
        case .reloadData:
            updateUI()
        }
    }
}

extension DetailViewController: DetailTableViewCellDelagete {
    func getImage(cell: DetailTableViewCell, needPerform action: DetailTableViewCell.Action) {
        switch action {
        case .getImageCollection(let indexPath):
            if let indexPath = indexPath {
                viewModel?.downloadImage(indexPath: indexPath, completion: { [weak self] (imgae) in
                    guard let this = self else { return }
                    if this.tableView.indexPathsForVisibleRows?.contains(indexPath) == true {
                        this.tableView.reloadRows(at: [indexPath], with: .none)
                    }
                })
            }
        }
    }
}
