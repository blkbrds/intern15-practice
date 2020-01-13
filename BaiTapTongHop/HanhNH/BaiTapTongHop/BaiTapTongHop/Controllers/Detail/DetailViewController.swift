//
//  DetailViewController.swift
//  BaiTapTongHop
//
//  Created by ANH NGUYỄN on 1/6/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

final class DetailViewController: BaseViewController {

    @IBOutlet private weak var tableView: UITableView!

    var viewModel = DetailViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    private func updateUI() {
        configTableView()
    }

    override func setupNavigation() {
        let tableViewButton = UIBarButtonItem(image: UIImage(named: "ic-navi-favorites"), style: .plain, target: self, action: #selector(showFavorites))
        navigationItem.rightBarButtonItem = tableViewButton
        tableViewButton.tintColor = .black
    }

    @objc private func showFavorites() {
        navigationController?.pushViewController(FavoriteViewController(), animated: true)
    }

    private func configTableView () {
        tableView.register(name: CellIdentifier.commentViewCell.rawValue)
        tableView.register(name: CellIdentifier.albumImageCell.rawValue)
        tableView.register(name: CellIdentifier.descriptionCell.rawValue)
        tableView.register(name: CellIdentifier.mapTableViewCell.rawValue)
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension DetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension DetailViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItems(section: section)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return viewModel.heightForRow(at: indexPath)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let type = DetailViewModel.SectionType(rawValue: indexPath.section) else { return UITableViewCell() }
        switch type {
        case .albums:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.albumImageCell.rawValue, for: indexPath) as? AlbumImageCell else { return UITableViewCell() }
            cell.viewModel = viewModel.makeAlbumViewModel(at: indexPath)
            return cell
        case .description:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.descriptionCell.rawValue, for: indexPath) as? DescriptionCell else { return UITableViewCell() }
            cell.viewModel = viewModel.makeDescription(at: indexPath)
            return cell
        case .map:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.mapTableViewCell.rawValue, for: indexPath) as? MapTableViewCell else { return UITableViewCell() }
            return cell
        default:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.commentViewCell.rawValue, for: indexPath) as? CommentViewCell else { return UITableViewCell() }
            cell.viewModel = viewModel.makeCommentViewModel(at: indexPath)
            return cell
        }
    }
}
