//
//  HomeViewController.swift
//  BaiTapTongHop
//
//  Created by PCI0018 on 11/22/19.
//  Copyright © 2019 Asian Tech. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

final class HomeViewController: ViewController {

    //MARK: - IBOutlet
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var collectionView: UICollectionView!

    //MARK: - Properties
    private var status: Layout = .row
    private var isLoadMore: Bool = true
    private var refreshControl = UIRefreshControl()
    private var collectionRefreshControl = UIRefreshControl()
    private var activityIndicator = NVActivityIndicatorView(frame: .zero)

    private var temp: Int = 0

    var viewModel = HomeViewModel()
    var homeImage: UIImage?

    enum Action {
        case like
        case changeLayout
        case reloadData
    }

    enum Layout {
        case grid
        case row
    }

    // MARK: - Setup UI
    override func setupUI() {
        super.setupUI()
        setupNavigation()
        setupTableView()
        setupCollectionView()
        setupRefreshControl()
    }

    // MARK: - Setup Data
    override func setupData() {
        tableView.alpha = 0
        activityIndicator.startAnimating()
        // Load data from API
        viewModel.loadPlaceData { (done, errorString) in
            self.activityIndicator.stopAnimating()
            self.tableView.alpha = 1
            if done {
                self.updateUI(action: .reloadData)
            } else {
                self.alert(title: App.Home.alertTitle, msg: errorString, buttons: ["OK"], preferButton: "OK", handler: nil)
            }
        }
    }

    //MARK: - Functions
    private func updateUI(action: Action, indexPath: IndexPath? = nil) {
        switch action {
        case .like:
            if let indexPath = indexPath {
                tableView.reloadRows(at: [indexPath], with: .none)
                collectionView.reloadItems(at: [indexPath])
            }
        case .changeLayout:
            collectionView.isHidden = !collectionView.isHidden
            tableView.isHidden = !tableView.isHidden
        case .reloadData:
            collectionView.reloadData()
            tableView.reloadData()
        }
    }

    private func loadMore() {
        viewModel.loadMore { (done, message) in
            if done {
                self.updateUI(action: .reloadData)
            } else {
                if message != "" {
                    self.alert(title: App.Home.alertTitle, msg: message, buttons: ["OK"], preferButton: "OK", handler: nil)
                }
            }
        }
        self.isLoadMore = !self.isLoadMore
    }

    @objc private func pullToRefresh() {
        viewModel.loadPlaceData { (done, errorString) in
            if done {
                self.refreshControl.endRefreshing()
                self.collectionRefreshControl.endRefreshing()
                self.updateUI(action: .reloadData)
            } else {
                self.alert(title: App.Home.alertTitle, msg: errorString, buttons: ["OK"], preferButton: "OK", handler: nil)
            }
        }
    }
}

// MARK: - Setup UI
extension HomeViewController {

    private func setupNavigation() {
        title = "Home"
        let changeLayoutButton = UIBarButtonItem(image: #imageLiteral(resourceName: "naviBar_icon_collection_icon.png"), style: .plain, target: self, action: #selector(switchLayout))
        navigationItem.rightBarButtonItem = changeLayoutButton
    }

    private func setupRefreshControl() {
        // Setup Indicator
        let frameOfIndicator = CGRect(x: UIScreen.main.bounds.width / 2 - 25, y: UIScreen.main.bounds.height / 2 - 25,
            width: 50, height: 50)
        activityIndicator.frame = frameOfIndicator
        activityIndicator.type = .lineScalePulseOut
        activityIndicator.color = .red
        view.addSubview(activityIndicator)

        // Setup tableview refresh control
        refreshControl.addTarget(self, action: #selector(pullToRefresh), for: .valueChanged)
        refreshControl.attributedTitle = NSAttributedString(string: "Fetching Places")
        refreshControl.tintColor = .systemPink
        refreshControl.alpha = 0.8

        // Setup collectionView refresh control
        collectionRefreshControl.addTarget(self, action: #selector(pullToRefresh), for: .valueChanged)
        collectionRefreshControl.attributedTitle = NSAttributedString(string: "Fetching Places")
        collectionRefreshControl.tintColor = .systemPink
        collectionRefreshControl.alpha = 0.8
    }

    private func setupCollectionView() {
        let homeCollectionViewCellNib = UINib(nibName: Config.homeCollectionViewCellIdentifier, bundle: .main)
        collectionView.register(homeCollectionViewCellNib, forCellWithReuseIdentifier: Config.homeCollectionViewCellIdentifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.refreshControl = collectionRefreshControl
    }

    private func setupTableView() {
        let homeTableViewCellNib = UINib(nibName: Config.homeTableViewCellIdentifier, bundle: Bundle.main)
        tableView.register(homeTableViewCellNib, forCellReuseIdentifier: Config.homeTableViewCellIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.refreshControl = refreshControl
    }
}

// MARK: - Objc Functions
extension HomeViewController {

    @objc private func switchLayout() {
        // Add change layout button on right navigation bar
        switch status {
        case .row:
            let changeLayoutButton = UIBarButtonItem(image: #imageLiteral(resourceName: "naviBar_icon_table_png.png"), style: .plain, target: self, action: #selector(switchLayout))
            navigationItem.rightBarButtonItem = changeLayoutButton
            status = .grid
        case .grid:
            let changeLayoutButton = UIBarButtonItem(image: #imageLiteral(resourceName: "naviBar_icon_collection_icon.png"), style: .plain, target: self, action: #selector(switchLayout))
            navigationItem.rightBarButtonItem = changeLayoutButton
            status = .row
        }
        updateUI(action: .changeLayout)
    }
}

//MARK: - TableView datasource, delegate
extension HomeViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getNumberOfPlaces()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Config.homeTableViewCellIdentifier, for: indexPath) as? HomeCell else { return TableCell() }
        cell.viewModel = viewModel.getHomeCellViewModel(indexPath: indexPath)

        // Load more
        if indexPath.row == viewModel.getNumberOfPlaces() - 2, isLoadMore {
            isLoadMore = !isLoadMore
            loadMore()
        }
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Config.rowHeight
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let okButton = UIAlertAction(title: "OK", style: .default) { (action) in
                self.viewModel.removePlace(at: indexPath)
                tableView.deleteRows(at: [indexPath], with: .left)
                self.collectionView.reloadData()
            }
            let cancelButton = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            let alert = UIAlertController(title: App.Home.alertTitle, message: App.Home.alertMessage, preferredStyle: .alert)
            alert.addAction(okButton)
            alert.addAction(cancelButton)
            present(alert, animated: true, completion: nil)
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewController()
        vc.dataSource = self
        vc.viewModel.indexOfItem = viewModel.currentIndex
        vc.viewModel = viewModel.getDetailViewModel(indexPath: indexPath)
        navigationController?.pushViewController(vc, animated: true)
    }
}

//MARK: - DetailViewController Delegate, DataSource
extension HomeViewController: DetailViewControllerDataSource {
    func getImageURLs() -> [String] {
        return viewModel.getImageURLs(with: viewModel.getPlaceID(with: viewModel.currentIndex))
    }
}

//MARK: - CollectionView datasource, delegate, DelegateFlowLayout
extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.getNumberOfPlaces()
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Config.homeCollectionViewCellIdentifier, for: indexPath) as? HomeCollectionCell else { return CollectionCell() }
        cell.viewModel = viewModel.getHomeCellViewModel(indexPath: indexPath)

        // Load more
        if indexPath.row == viewModel.getNumberOfPlaces() - 2 {
            loadMore()
        }
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = DetailViewController()
        vc.dataSource = self
        vc.viewModel.indexOfItem = viewModel.currentIndex
        vc.viewModel = viewModel.getDetailViewModel(indexPath: indexPath)
        navigationController?.pushViewController(vc, animated: true)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return Config.sizeOfCell
    }
}

// MARK: - MapViewController DataSource
extension HomeViewController: MapViewControllerDataSource {
    func getPlaces() -> [GooglePlace] {
        return viewModel.getPlaces()
    }
}

//MARK: - Config
extension HomeViewController {

    struct Config {
        static let homeTableViewCellIdentifier: String = "HomeCell"
        static let homeCollectionViewCellIdentifier: String = "HomeCollectionCell"
        static let rowHeight: CGFloat = (UIScreen.main.bounds.height - 50) / 6
        static let sizeOfCell: CGSize = {
            let numberOfColumn: CGFloat = 2
            let width: CGFloat = (UIScreen.main.bounds.width - 30) / numberOfColumn
            let height: CGFloat = 1.4 * width
            return CGSize(width: width, height: height)
        }()
    }
}
