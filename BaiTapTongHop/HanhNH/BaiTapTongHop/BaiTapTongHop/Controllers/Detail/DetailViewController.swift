//
//  DetailViewController.swift
//  BaiTapTongHop
//
//  Created by ANH NGUYỄN on 1/6/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

final class DetailViewController: BaseViewController {

    @IBOutlet private weak var detailTableView: UITableView!

    var viewModel = DetailViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        configData()
    }

    func updateUI() {
        cofigTableView()
    }

    private func configData() {
        viewModel.loadData { [weak self] (done) in
            guard let this = self else { return }
            if done {
                this.updateUI()
            } else {
                this.alert(title: Strings.error)
            }
        }
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
        
        detailTableView.register(name: CellIdentifier.detailTableViewCell.rawValue)
        detailTableView.register(name: CellIdentifier.sliderDetailTableViewCell.rawValue)
        detailTableView.register(name: CellIdentifier.commentTableViewCell.rawValue)
        detailTableView.register(name: CellIdentifier.mapTableViewCell.rawValue)
        detailTableView.dataSource = self
        detailTableView.delegate = self
    }
}

extension DetailViewController {
    struct Config {
        static let defaultRowHeight: CGFloat = 150
        static let section: Int = 1
        static let numberOfSections: Int = 4
    }
}

extension DetailViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return Config.numberOfSections
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return Config.section
        case 1:
            return Config.section
        case 2:
            return Config.section
        default:
            return viewModel.comment.count
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return Config.defaultRowHeight
        case 1:
            return UITableView.automaticDimension
        case 2:
            return Config.defaultRowHeight
        default:
            return UITableView.automaticDimension
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = detailTableView.dequeueReusableCell(withIdentifier: CellIdentifier.sliderDetailTableViewCell.rawValue, for: indexPath) as? SliderDetailTableViewCell else { return UITableViewCell() }
            return cell
        case 1:
            guard let cell = detailTableView.dequeueReusableCell(withIdentifier: CellIdentifier.commentTableViewCell.rawValue, for: indexPath) as? CommentTableViewCell else { return UITableViewCell() }
            return cell
        case 2:
            guard let cell = detailTableView.dequeueReusableCell(withIdentifier: CellIdentifier.mapTableViewCell.rawValue, for: indexPath) as? MapTableViewCell else { return UITableViewCell() }
            return cell
        default:
            guard let cell = detailTableView.dequeueReusableCell(withIdentifier: CellIdentifier.detailTableViewCell.rawValue, for: indexPath) as? DetailTableViewCell else { return UITableViewCell() }
            let item = viewModel.comment[indexPath.row]
            cell.updateDetail(image: item.avatarImage , status: item.content, name: item.name, day: item.createds)
            return cell
        }
    }
}
