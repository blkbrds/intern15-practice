//
//  HomeViewController.swift
//  BaiTapTongHop
//
//  Created by PCI0018 on 11/22/19.
//  Copyright © 2019 Asian Tech. All rights reserved.
//

import UIKit

final class HomeViewController: ViewController {

    //MARK: - IBOutlet
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var collectionView: UICollectionView!
    
    //MARK: - Private Properties
    private var homeTableViewCellIdentifier: String = "HomeCell"
    private var homeCollectionViewCellIdentifier: String = "HomeCollectionCell"
    private var searchPlaces: [Place] = []
    private var status: Layout = .row
    var temp = PracticeAPI()

    var viewModel = HomeViewModel()

    enum Action {
        case like
        case changeLayout
    }

    enum Layout {
        case grid
        case row
    }

    //MARK: - Override Functions
    override func setupUI() {
        super.setupUI()
        title = "Home"
        setupData()
        
        temp.evolutionChains {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }

        // Add change layout button on right navigation bar
        let changeLayoutButton = UIBarButtonItem(image: #imageLiteral(resourceName: "naviBar_icon_collection_icon.png"), style: .plain, target: self, action: #selector(switchLayout))
        navigationItem.rightBarButtonItem = changeLayoutButton

        // Config table view
        let homeTableViewCellNib = UINib(nibName: homeTableViewCellIdentifier, bundle: Bundle.main)
        tableView.register(homeTableViewCellNib, forCellReuseIdentifier: homeTableViewCellIdentifier)
        tableView.delegate = self
        tableView.dataSource = self

        // Config collection view
        let homeCollectionViewCellNib = UINib(nibName: homeCollectionViewCellIdentifier, bundle: .main)
        collectionView.register(homeCollectionViewCellNib, forCellWithReuseIdentifier: homeCollectionViewCellIdentifier)
        collectionView.dataSource = self
        collectionView.delegate = self
    }

    //MARK: - Objc private Functions
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

    //MARK: - Private Functions
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
        }
    }
    
    private func setupData() {
        searchPlaces = Place.places
    }
}

//MARK: - Extension TableView datasource, delegate
extension HomeViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getNumberOfPlaces()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: homeTableViewCellIdentifier, for: indexPath) as? HomeCell else { return TableCell() }
        cell.viewModel = viewModel.getHomeCellViewModel(indexPath: indexPath)
        cell.delegate = self
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Config.rowHeight
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let okButton = UIAlertAction(title: "OK", style: .default) { (action) in
                Place.places.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .left)
                self.collectionView.reloadData()
            }
            let cancelButton = UIAlertAction(title: "Cancel", style: .default, handler: nil)
            let alert = UIAlertController(title: "Thông Báo", message: App.Home.alertMessage, preferredStyle: .alert)
            alert.addAction(okButton)
            alert.addAction(cancelButton)
            present(alert, animated: true, completion: nil)
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewController()
        vc.viewModel = viewModel.getDetailViewModel(indexPath: indexPath)
        navigationController?.pushViewController(vc, animated: true)
    }
}

//MARK: - Extension HomeCell Delegate
extension HomeViewController: HomeCellDelegate {

    func cell(cell: HomeCell, needsPerform action: HomeCell.Action) {
        switch action {
        case .addFavorite:
            guard let index = tableView.indexPath(for: cell) else {
                alert(title: "Warning", msg: "Can not add Favortie", buttons: ["OK"], preferButton: "", handler: nil)
                return
            }
            viewModel.changeFavorite(at: index.row) { (done, error) in
                if done {
                    self.updateUI(action: .like, indexPath: index)
                } else {
                    alert(title: "Warning", msg: error, buttons: ["OK"], preferButton: "", handler: nil)
                }
            }
        }
    }

}

//MARK: - Exetension CollectionView datasource, delegate, DelegateFlowLayout
extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.getNumberOfPlaces()
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: homeCollectionViewCellIdentifier, for: indexPath) as? HomeCollectionCell else { return CollectionCell() }
        cell.viewModel = viewModel.getHomeCellViewModel(indexPath: indexPath)
        cell.delegate = self
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return Config.sizeOfCell
    }
}

//MARK: - Extension HomeCollectionCell Delegate
extension HomeViewController: HomeCollectionCellDelegate {

    func cell(cell: HomeCollectionCell, needsPerform action: HomeCollectionCell.Action) {
        switch action {
        case .addFavorite:
            guard let index = collectionView.indexPath(for: cell) else {
                alert(title: "Warning", msg: "Can not add Favortie", buttons: ["OK"], preferButton: "", handler: nil)
                return
            }
            viewModel.changeFavorite(at: index.row) { (done, error) in
                if done {
                    self.updateUI(action: .like, indexPath: index)
                } else {
                    alert(title: "Warning", msg: error, buttons: ["OK"], preferButton: "", handler: nil)
                }
            }
        }
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        navigationController?.pushViewController(DetailViewController(), animated: true)
    }
}

extension HomeViewController {
    
    struct Config {
        
        static let rowHeight: CGFloat = 100
        static let sizeOfCell: CGSize = {
            let numberOfColumn: CGFloat = 2
            let width: CGFloat = (UIScreen.main.bounds.width - 30) / numberOfColumn
            let height: CGFloat = 1.4 * width
            return CGSize(width: width, height: height)
        }()
    }
}
