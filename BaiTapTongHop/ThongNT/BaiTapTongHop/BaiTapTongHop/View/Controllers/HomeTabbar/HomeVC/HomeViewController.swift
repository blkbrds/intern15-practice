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
    
    private var homeCellIndentifier: String = "HomeTableViewCell"
    var viewModel = HomeViewModel()
    
    enum Action {
        case like
    }
    
    //MARK: - Override Functions
    override func setupUI() {
        super.setupUI()
        title = "Home"
        
        // Config table view
        let nib = UINib(nibName: homeCellIndentifier, bundle: Bundle.main)
        tableView.register(nib, forCellReuseIdentifier: homeCellIndentifier)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func updateUI(action: Action, indexPath: IndexPath? = nil) {
        switch action {
        case .like:
            if let indexPath = indexPath {
                tableView.reloadRows(at: [indexPath], with: .automatic)
            }
        }
    }
}

//MARK: - Table View datasource, delegate
extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getNumberOfPlaces()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: homeCellIndentifier, for: indexPath) as? HomeTableViewCell else { return UITableViewCell() }
        cell.viewModel = HomeCellViewModel(place: (viewModel.getPlace(at: indexPath.row)))
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

extension HomeViewController: HomeTableViewCellDelegate {
    func addFavorite(view: HomeTableViewCell, needsPerform action: HomeTableViewCell.Action) {
        switch action {
        case .addFavorite:
            guard let index = tableView.indexPath(for: view) else {
                // show alert
                return
            }
            viewModel.changeFavorite(at: index.row) { (done, error) in
                if done {
                    self.updateUI(action: .like, indexPath: index)
                } else {
                    //show alert with error
                }
            }
        }
    }
}
