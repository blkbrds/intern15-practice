//
//  HomeViewController.swift
//  BaiTapTongHop
//
//  Created by ANH NGUYỄN on 1/6/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

final class HomeViewController: BaseViewController {

    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private weak var tableView: UITableView!

    var viewModel = HomeViewModel()
    private let tableRefreshControl = UIRefreshControl()
    private let collectionRefreshControl = UIRefreshControl()

    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        configData()
    }

    func updateUI() {
        if viewModel.isShowTableView {
            tableView.isHidden = false
            collectionView.isHidden = true
            tableView.reloadData()
            tableRefreshControl.endRefreshing()
        } else {
            tableView.isHidden = true
            collectionView.isHidden = false
            collectionView.reloadData()
            collectionRefreshControl.endRefreshing()
        }
    }

    func configUI() {
        configTableView()
        configCollectionView()
        refreshTabView()
        refreshCollection()
    }

    func configData() {
        // -MARK: load Data
        viewModel.loadAPI() { [weak self] (done, arg) in
            guard let this = self else { return }
            if done {
                this.updateUI()
            } else {
                //show alertview --> bao' loi~
                let alert = UIAlertController(title: Strings.error, message: Strings.notData, preferredStyle: UIAlertController.Style.alert)
                // add an action (button)
                alert.addAction(UIAlertAction(title: Strings.ok, style: UIAlertAction.Style.default, handler: nil))
                // show the alert
                this.present(alert, animated: true, completion: nil)
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
        //change barbutton
        let collectionViewButton = UIBarButtonItem(image: UIImage(named: "collectionMenu"), style: .plain, target: self, action: #selector(showCollectionView))
        navigationItem.rightBarButtonItem = collectionViewButton
        collectionViewButton.tintColor = .black
        //change isShow
        viewModel.changeDisplay { [weak self] (done) in
            guard let this  = self else  { return }
            if done {
                this.updateUI()
            } else {
                //show alertview --> bao' loi~
                let alert = UIAlertController(title: Strings.error, message: "Khong Lay Duoc Data", preferredStyle: UIAlertController.Style.alert)
                // add an action (button)
                alert.addAction(UIAlertAction(title: Strings.ok, style: UIAlertAction.Style.default, handler: nil))
                // show the alert
                this.present(alert, animated: true, completion: nil)
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
                //show alertview --> bao' loi~
                let alert = UIAlertController(title: Strings.error, message: Strings.notData, preferredStyle: UIAlertController.Style.alert)
                // add an action (button)
                alert.addAction(UIAlertAction(title: Strings.ok, style: UIAlertAction.Style.default, handler: nil))
                // show the alert
                this.present(alert, animated: true, completion: nil)
            }
        }

    }

    func configTableView() {
        //cell
        let nib = UINib(nibName: CellIdentifier.homeTableViewCell.rawValue, bundle: Bundle.main)
        tableView.register(nib, forCellReuseIdentifier: CellIdentifier.homeTableViewCell.rawValue)
        //header
        let nib2 = UINib(nibName: CellIdentifier.sliderTableViewCell.rawValue, bundle: Bundle.main)
        tableView.register(nib2, forCellReuseIdentifier: CellIdentifier.sliderTableViewCell.rawValue)
        //delegate & datasource
        tableView.delegate = self
        tableView.dataSource = self
    }

    func configCollectionView() {
        let nib = UINib(nibName: CellIdentifier.homeCollectionViewCell.rawValue, bundle: Bundle.main)
        collectionView.register(nib, forCellWithReuseIdentifier: CellIdentifier.homeCollectionViewCell.rawValue)
        let nib2 = UINib(nibName: CellIdentifier.sliderCollectionCell.rawValue, bundle: Bundle.main)
        collectionView.register(nib2, forCellWithReuseIdentifier: CellIdentifier.sliderCollectionCell.rawValue)
        collectionView.dataSource = self
        collectionView.delegate = self
    }

    // MARK: - API
    func loadAPI() {
        viewModel.loadAPI() { [weak self] (done, errorMessage) in
            guard let this = self else { return }
            if done {
                this.updateUI()
            } else {
                // Show alert
                let alert = UIAlertController(title: Strings.error, message: Strings.notData, preferredStyle: UIAlertController.Style.alert)
                // add an action (button)
                alert.addAction(UIAlertAction(title: Strings.ok, style: UIAlertAction.Style.default, handler: nil))
                // show the alert
                this.present(alert, animated: true, completion: nil)
            }
        }
    }

    func loadMore() {
        viewModel.loadMore() { [weak self] (done, errorMessage) in
            guard let this  = self else { return }
            if done {
                this.updateUI()
            } else {
                 // Show alert
                let alert = UIAlertController(title: Strings.error, message: Strings.notLoadMore, preferredStyle: UIAlertController.Style.alert)
                // add an action (button)
                alert.addAction(UIAlertAction(title: Strings.ok, style: UIAlertAction.Style.default, handler: nil))
                // show the alert
                this.present(alert, animated: true, completion: nil)
            }
        }
    }

    func refreshTabView() {
        tableRefreshControl.tintColor = .black
        let attributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        tableRefreshControl.attributedTitle = NSAttributedString(string: Strings.refesh, attributes: attributes)
        tableRefreshControl.addTarget(self, action: #selector(refresPullUpTabelView), for: .valueChanged)
        tableView.refreshControl = tableRefreshControl
    }

    // MARK: - Action
    @objc func refresPullUpTabelView() {
        viewModel.loadAPI() { [weak self] (done, errorMessage) in
            guard let this = self else { return }
            if done {
                this.updateUI()
            } else {
                // Show alert
                let alert = UIAlertController(title: Strings.error, message: Strings.notData, preferredStyle: UIAlertController.Style.alert)
                // add an action (button)
                alert.addAction(UIAlertAction(title: Strings.ok, style: UIAlertAction.Style.default, handler: nil))
                // show the alert
                this.present(alert, animated: true, completion: nil)
            }
        }
    }

    func refreshCollection() {
        collectionRefreshControl.tintColor = .black
        let attributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        collectionRefreshControl.attributedTitle = NSAttributedString(string: Strings.refesh, attributes: attributes)
        collectionRefreshControl.addTarget(self, action: #selector(refreshPullUpCollection), for: .valueChanged)
        collectionView.refreshControl = collectionRefreshControl
    }

    @objc func refreshPullUpCollection() {
        viewModel.loadAPI() { [weak self] (done, errorMessage) in
            guard let this = self else { return }
            if done {
                this.updateUI()
            } else {
                // Show alert
                let alert = UIAlertController(title: Strings.error, message: Strings.notRefresh, preferredStyle: UIAlertController.Style.alert)
                // add an action (button)
                alert.addAction(UIAlertAction(title: Strings.ok, style: UIAlertAction.Style.default, handler: nil))
                // show the alert
                this.present(alert, animated: true, completion: nil)
            }
        }
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
        return viewModel.repos.count
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //section dau tien vs section thu 2 la 0 vs 1
        if indexPath.section == 0 {
            return 150
        }
        return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            //slider
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.sliderTableViewCell.rawValue, for: indexPath) as? SliderTableViewCell else {
                return UITableViewCell()
            }
            cell.dataSoucre = self
            return cell

        } else if indexPath.section == 1 {
            //cells
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.homeTableViewCell.rawValue, for: indexPath) as? HomeTableViewCell else {
                return UITableViewCell()
            }
            //tra du lieu ve cho Cell indexPath và delagate
            cell.indexPath = indexPath
            cell.delagate = self
            //gan vieModelCell = viewModel
            cell.viewModel = viewModel.getHomeCellModel(atIndexPath: indexPath)
            return cell
        }
        return UITableViewCell()
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigationController?.pushViewController(DetailViewController(), animated: true)
    }

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        if offsetY >= contentHeight - scrollView.frame.size.height {
            loadMore()
        }
    }

    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if !decelerate {
            let offsetY = scrollView.contentOffset.y
            let contentHeight = scrollView.contentSize.height
            if offsetY >= contentHeight - scrollView.frame.size.height {
                loadMore()
            }
        }
    }
}

// Tách ra 2 extension
extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // xet frame size cho 2 section
        if indexPath.section == 0 {
            let width = collectionView.frame.width - 10
            return CGSize(width: width, height: 150)
        } else if indexPath.section == 1 {
            let width = collectionView.frame.width - 20
            return CGSize(width: width / 3, height: 250)
        }
        return CGSize(width: 0, height: 0)
    }
}

extension HomeViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return viewModel.numberOfSections()
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            //slider Header
            return 1
        } else if section == 1 {
            return viewModel.repos.count
        }
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // 2 section
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
            cell.delageteCollection = self
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
        return viewModel.imageSlide(in: indexPath.row).imageName
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
        return viewModel.imageSlide(in: indexPath.row).imageName
    }
}

extension HomeViewController: HomeTableViewCellDelagete {
    func getImage(cell: HomeTableViewCell, indexPath: IndexPath?) {
        if let indexPath = indexPath {
            // downlodaImage
            viewModel.downloadImage(indexPath: indexPath) { (image) in
                self.tableView.reloadRows(at: [indexPath], with: .none)
            }
        }
    }
}

extension HomeViewController: HomeCollectionViewCellDelegate {
    func getImageCollection(cell: HomeCollectionViewCell, indexPath: IndexPath?) {
        if let indexPath = indexPath {
            viewModel.downloadImage(indexPath: indexPath) { (imgae) in
                self.collectionView.reloadItems(at: [indexPath])
            }
        }
    }
}
