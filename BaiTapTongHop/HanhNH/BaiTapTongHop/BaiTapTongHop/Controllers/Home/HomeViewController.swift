//
//  HomeViewController.swift
//  BaiTapTongHop
//
//  Created by ANH NGUYỄN on 1/6/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit
import RealmSwift

final class HomeViewController: BaseViewController {

    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private weak var tableView: UITableView!

    var viewModel = HomeViewModel()
    private let tableRefreshControl = UIRefreshControl()
    private let collectionRefreshControl = UIRefreshControl()

    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        configData(isRefresh: true)
    }

    func updateUI() {
        if viewModel.isShowTableView {
            tableView.isHidden = false
            collectionView.isHidden = true
            tableView.reloadData()
            collectionView.reloadData()
            tableRefreshControl.endRefreshing()
        } else {
            tableView.isHidden = true
            collectionView.isHidden = false
            collectionView.reloadData()
            tableView.reloadData()
            collectionRefreshControl.endRefreshing()
        }
    }

    func configUI() {
        configTableView()
        configCollectionView()
        // MARK: - Refresh control for tableView view
        tableRefreshControl.tintColor = .black
        let tableViewAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        tableRefreshControl.attributedTitle = NSAttributedString(string: Strings.refesh, attributes: tableViewAttributes)
        tableRefreshControl.addTarget(self, action: #selector(tableViewDidScrollToTop), for: .valueChanged)
        tableView.refreshControl = tableRefreshControl
        collectionView.refreshControl = collectionRefreshControl
        // MARK: - Refresh control for collection view
        collectionRefreshControl.tintColor = .black
        let collectionAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        collectionRefreshControl.attributedTitle = NSAttributedString(string: Strings.refesh, attributes: collectionAttributes)
        collectionRefreshControl.addTarget(self, action: #selector(collectionViewDidScrollToTop), for: .valueChanged)
        collectionView.refreshControl = collectionRefreshControl
    }

//    private func configData(isRefresh: Bool) {
//        if isRefresh == true {
//            viewModel.page = 1
//        } else {
//            viewModel.page = viewModel.page + 1
//        }
//        viewModel.loadAPI() { [weak self] (result) in
//            guard let this = self else { return }
//            switch result {
//            case .success:
//                this.updateUI()
//            case .failure(let error):
//                this.alert(title: error.localizedDescription)
//            }
//        }
//    }
    private func configData(isRefresh: Bool) {
        viewModel.loadDummyData { (done) in
            if done {
                self.updateUI()
            } else {
                self.alert(title: Strings.notData)
            }
        }
    }

    override func setupNavigation() {
        title = "Home"
        let tableViewButton = UIBarButtonItem(image: UIImage(named: "ic-image-menu"), style: .plain, target: self, action: #selector(showTableView))
        navigationItem.rightBarButtonItem = tableViewButton
        tableViewButton.tintColor = .black
    }

    @objc func showTableView() {
        let collectionViewButton = UIBarButtonItem(image: UIImage(named: "collectionMenu"), style: .plain, target: self, action: #selector(showCollectionView))
        navigationItem.rightBarButtonItem = collectionViewButton
        collectionViewButton.tintColor = .black
        viewModel.changeDisplay { [weak self] (done) in
            guard let this = self else { return }
            if done {
                this.updateUI()
            } else {
                this.alert(title: Strings.error, message: Strings.notData)
            }
        }
    }

    @objc func showCollectionView() {
        let tableViewButton = UIBarButtonItem(image: UIImage(named: "ic-image-menu"), style: .plain, target: self, action: #selector(showTableView))
        navigationItem.rightBarButtonItem = tableViewButton
        tableViewButton.tintColor = .black

        viewModel.changeDisplay { [weak self] (done) in
            guard let this = self else { return }
            if done {
                this.updateUI()
            } else {
                this.alert(title: Strings.error, message: Strings.notData)
            }
        }

    }

    func configTableView() {
        tableView.register(name: CellIdentifier.homeTableViewCell.rawValue)
        tableView.register(name: CellIdentifier.sliderTableViewCell.rawValue)
        tableView.delegate = self
        tableView.dataSource = self
    }

    func configCollectionView() {
        collectionView.register(name: CellIdentifier.homeCollectionViewCell.rawValue)
        collectionView.register(name: CellIdentifier.sliderCollectionCell.rawValue)
        collectionView.dataSource = self
        collectionView.delegate = self
    }

    // MARK: - Action
    @objc func tableViewDidScrollToTop() {
//        configData(isRefresh: true)
    }

    @objc func collectionViewDidScrollToTop() {
//        configData(isRefresh: true)
    }
}

extension HomeViewController {
    struct Config {
        static let defaultRowHeight: CGFloat = 150
    }
}

// MARK: - UITableViewDataSource, UITableViewDelegate
extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        return viewModel.users.count
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return Config.defaultRowHeight
        }
        return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.sliderTableViewCell.rawValue, for: indexPath) as? SliderTableViewCell else {
                return UITableViewCell()
            }
            cell.dataSource = self
            return cell

        } else if indexPath.section == 1 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.homeTableViewCell.rawValue, for: indexPath) as? HomeTableViewCell else {
                return UITableViewCell()
            }
            cell.indexPath = indexPath
//            cell.delagate = self
            cell.viewModel = viewModel.getHomeCellModel(atIndexPath: indexPath)
            return cell
        }
        return UITableViewCell()
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewController()
        vc.viewModel = viewModel.getUser(at: indexPath)
        navigationController?.pushViewController(vc, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        if offsetY >= contentHeight - scrollView.frame.size.height {
//            configData(isRefresh: false)
        }
    }

    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if !decelerate {
            let offsetY = scrollView.contentOffset.y
            let contentHeight = scrollView.contentSize.height
            if offsetY >= contentHeight - scrollView.frame.size.height {
//                configData(isRefresh: false)
            }
        }
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 {
            let width = collectionView.frame.width - 10
            return CGSize(width: width, height: 150)
        } else if indexPath.section == 1 {
            let width = collectionView.frame.width - 20
            return CGSize(width: width / 3, height: 250)
        }
        return CGSize.zero
    }
}

extension HomeViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return viewModel.numberOfSections()
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else if section == 1 {
            return viewModel.users.count
        }
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellIdentifier.sliderCollectionCell.rawValue, for: indexPath) as? SliderCollectionCell else {
                return UICollectionViewCell()
            }
            cell.dataSource = self
            return cell
        } else if indexPath.section == 1 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellIdentifier.homeCollectionViewCell.rawValue, for: indexPath) as? HomeCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.indexPath = indexPath
//            cell.delegateCollection = self
            cell.viewModel = viewModel.getHomeCellModel(atIndexPath: indexPath)
            return cell
        }
        return UICollectionViewCell()
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        navigationController?.pushViewController(DetailViewController(), animated: true)
    }
}

extension HomeViewController: SliderTableViewDataSoucre {
    func numberOfSection() -> Int {
        return viewModel.numberSectionSlide()
    }

    func numberRow(in section: Int) -> Int {
        return viewModel.numberImageSlide()
    }

    func imageSlide(in indexPath: IndexPath) -> String {
        return viewModel.imageNameForSlide(in: indexPath.row)
    }
}

extension HomeViewController: SliderCollectionCellDataSource {
    func numberOfSectionCollection() -> Int {
        return viewModel.numberSectionSlide()
    }

    func numberRowImage(in section: Int) -> Int {
        return viewModel.numberImageSlide()
    }

    func imageSlideCollection(in indexPath: IndexPath) -> String {
        return viewModel.imageNameForSlide(in: indexPath.row)
    }
}

//extension HomeViewController: HomeTableViewCellDelagete {
//    func getImage(cell: HomeTableViewCell, needPerform action: HomeTableViewCell.Action) {
//        switch action {
//        case .getImageCollection(let indexPath):
//            if let indexPath = indexPath {
//                viewModel.downloadImage(indexPath: indexPath) { (image) in
//                    //co mot cell khong ton tai
//                    if self.tableView.indexPathsForVisibleRows?.contains(indexPath) == true {
//                        self.tableView.reloadRows(at: [indexPath], with: .none)
//                    }
//                }
//            }
//        }
//    }
//}

//extension HomeViewController: HomeCollectionViewCellDelegate {
//    func cell(cell: HomeCollectionViewCell, needPerform action: HomeCollectionViewCell.Action) {
//        switch action {
//        case .getImageCollection(let indexPath):
//            if let indexPath = indexPath {
//                viewModel.downloadImage(indexPath: indexPath) { (image) in
//                    if self.collectionView.indexPathsForVisibleItems.contains(indexPath) == true {
//                        self.collectionView.reloadItems(at: [indexPath])
//                    }
//                }
//            }
//        }
//    }
//}
