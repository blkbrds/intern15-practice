//
//  DetailViewController.swift
//  BaiTapTongHop
//
//  Created by PCI0018 on 11/25/19.
//  Copyright © 2019 Asian Tech. All rights reserved.
//

import UIKit
import MapKit

protocol DetailViewControllerDataSource: class {
    func getImageURLs() -> [String]
}

final class DetailViewController: ViewController {

    @IBOutlet private weak var tableView: UITableView!

    private let commentCell: String = "DetailTableViewCell"
    private let slideCell: String = "SlideTableViewCell"

    enum Action {
        case sendIdPlace(idPlace: String)
    }

    //MARK: - Properties
    private let cellIdentifier: String = "DetailTableViewCell"
    weak var dataSource: DetailViewControllerDataSource?
    var viewModel = DetailViewModel()

    // MARK: - Setup
    override func setupUI() {
        super.setupUI()
        configTableView()
    }

    override func setupData() {
        loadImageURLs()
    }

    private func configTableView() {
        title = "Detail"
        tableView.register(UINib(nibName: cellIdentifier, bundle: .main), forCellReuseIdentifier: cellIdentifier)
        tableView.register(UINib(nibName: slideCell, bundle: .main), forCellReuseIdentifier: slideCell)
        tableView.delegate = self
        tableView.dataSource = self

        switch tabBarController?.selectedIndex {
        case 0:
            let addFavoriteButton = UIBarButtonItem()
            let mapButton = UIBarButtonItem(image: #imageLiteral(resourceName: "icons8-map-50.png"), style: .plain, target: self, action: #selector(moveToMap))
            if checkIsFavorite() {
                addFavoriteButton.image = #imageLiteral(resourceName: "icons8-add-to-favorites-50 (1).png")
                addFavoriteButton.style = .plain
                addFavoriteButton.target = self
                addFavoriteButton.action = #selector(addToFavorite)
            }
            navigationItem.rightBarButtonItems = [addFavoriteButton, mapButton]
        case 2:
            let mapButton = UIBarButtonItem(image: #imageLiteral(resourceName: "icons8-map-50.png"), style: .plain, target: self, action: #selector(moveToMap))
            let removeButton = UIBarButtonItem(title: "Remove", style: .plain, target: self, action: #selector(removeFromFavorite))
            navigationItem.rightBarButtonItems = [removeButton, mapButton]
        default:
            break
        }
    }

    private func checkIsFavorite() -> Bool {
        return RealmManager.shared.checkPK(id: viewModel.getIdPlace())
    }

    private func loadImageURLs() {
        viewModel.loadImageURLs { (done, array) in
            if !done {
                return
            }
            self.viewModel.setImageURLs(with: array)
            self.tableView.reloadData()
        }
    }
    
    @objc private func moveToMap() {
        UserDefaults.standard.set(viewModel.getIdPlace(), forKey: "placeSelected")
        tabBarController?.selectedIndex = 1
    }

    @objc private func addToFavorite() {
        viewModel.addPlaceToRealm { (done, error) in
            if done {
                self.alert(msg: "Added to Favorite", handler: nil)
            } else {
                self.alert(msg: error, handler: nil)
            }
        }
    }

    @objc private func removeFromFavorite() {
        let okButton = UIAlertAction(title: "OK", style: .default) { (action) in
            self.viewModel.removePlaceFromRealm { (done, error) in
                if done {
                    self.alert(msg: "Removed") { (action) in
                        self.navigationController?.popViewController(animated: true)
                    }
                } else {
                    self.alert(msg: error) { (action) in
                        self.navigationController?.popViewController(animated: true)
                    }
                }
            }
        }
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let alert = UIAlertController(title: App.Home.alertTitle, message: App.Home.alertMessage, preferredStyle: .alert)
        alert.addAction(okButton)
        alert.addAction(cancelButton)
        present(alert, animated: true, completion: nil)
    }
}

//MARK: - Extention TableView
extension DetailViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 6
        default:
            return 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: slideCell, for: indexPath) as? SlideTableViewCell else { return UITableViewCell() }
            cell.imageURLs = viewModel.getImageURLs()
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? DetailTableViewCell else { return UITableViewCell() }
            return cell
        default:
            return UITableViewCell()
        }
    }
}

extension DetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return UIScreen.main.bounds.height / 3
        case 1:
            return UIScreen.main.bounds.height / 9
        default:
            return 100
        }
    }
}

extension DetailViewController: MapViewControllerDataSource {
    func getPlaces() -> [GooglePlace] {
        return [viewModel.getPlace()]
    }
}
