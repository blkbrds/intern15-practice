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
        viewModel.loadData()
    }

    func updateUI() {
        cofigTableView()
    }
    
    override func setupNavigation() {
        let tableViewButton = UIBarButtonItem(image: UIImage(named: "ic-navi-favorites"), style: .plain, target: self, action: #selector(showFavorites))
        navigationItem.rightBarButtonItem = tableViewButton
        tableViewButton.tintColor = .black
    }

    @objc func showFavorites() {
        navigationController?.pushViewController(FavoriteViewController(), animated: true)
    }

    func cofigTableView () {
        tableView.register(name: CellIdentifier.commentViewCell.rawValue)
        tableView.register(name: CellIdentifier.albumImageCell.rawValue)
        tableView.register(name: CellIdentifier.descriptionCell.rawValue)
        tableView.register(name: CellIdentifier.mapTableViewCell.rawValue)
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension DetailViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSection()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItem(section: section)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return viewModel.heightForRowAt(indexPath: indexPath)
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
