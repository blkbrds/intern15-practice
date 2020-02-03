//
//  HomeViewController.swift
//  BaiTapRealm
//
//  Created by ANH NGUYỄN on 1/22/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit
import RealmSwift

final class HomeViewController: BaseViewController {

    @IBOutlet weak var tableView: UITableView!
    var viewModel = HomeViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        print(Realm.Configuration.defaultConfiguration.fileURL?.absoluteURL)
    }

    override func setupNavigation() {
        title = "Home"
        let barButtonItem = UIBarButtonItem(image: UIImage(named: "ic-reset-home"), style: .plain, target: self, action: #selector(resetAPI))
        navigationItem.rightBarButtonItem = barButtonItem
        barButtonItem.tintColor = .black
    }
    
    @objc func resetAPI() {
        viewModel.reset { [weak self] (result) in
            guard let this = self else { return }
            switch result {
            case .success:
                this.updateUI()
            case .failure(let error):
                this.alert(title: error.localizedDescription)
            }
        }
    }

    func updateUI() {
        tableView.reloadData()
    }

    override func configUI() {
        super.configUI()
        tableView.register(name: CellIdentifier.homeTableViewCell.rawValue)
        tableView.delegate = self
        tableView.dataSource = self
    }

    override func configData() {
        super.configData()
        viewModel.loadAPI() { [weak self] (result) in
            guard let this = self else { return }
            switch result {
            case .success:
                this.updateUI()
            case .failure(let error):
                this.alert(title: error.localizedDescription)
            }
        }
    }
}
extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection(section: section)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.homeTableViewCell.rawValue, for: indexPath) as? HomeTableViewCell else { return UITableViewCell() }
        cell.indexPath = indexPath
        cell.delagate = self
        cell.viewModel = viewModel.getHomeCellModel(atIndexPath: indexPath)
        return cell
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewController()
        vc.viewModel = viewModel.getRepo(at: indexPath)
        navigationController?.pushViewController(vc, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension HomeViewController: HomeTableViewCellDelagete {
    func getImage(cell: HomeTableViewCell, needPerform action: HomeTableViewCell.Action) {
        switch action {
        case .getImageCollection(let indexPath):
            if let indexPath = indexPath {
                viewModel.downloadImage(indexPath: indexPath) { [weak self] (image) in
                    guard let this = self else { return }
                    if this.tableView.indexPathsForVisibleRows?.contains(indexPath) == true {
                        this.tableView.reloadRows(at: [indexPath], with: .none)
                    }
                }
            }
        }
    }
}
