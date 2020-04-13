//
//  HomeViewController.swift
//  BaiTap3API
//
//  Created by Sếp Quân on 4/13/20.
//  Copyright © 2020 QuanBT. All rights reserved.
//

import UIKit

final class HomeViewController: UIViewController {
    // MARK: - IBOutlet
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var searchBar: UISearchBar!
    
    // MARK: - Properties
    private var viewModel = HomeViewModel()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    // MARK: - Function
    private func setupView() {
        title = "Home"
        let nib = UINib(nibName: "HomeTableViewCell", bundle: .main)
        tableView.register(nib, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.rowHeight = 100
        loadAPI()
        searchBar.delegate = self
    }
    
    private func loadAPI() {
        print("Load API")
        viewModel.loadAPI {  (done, msg) in
            if done {
                self.viewModel.dataAPISearchs = self.viewModel.dataAPIs
                self.tableView.reloadData()
            } else {
                print("API erorr: \(msg)")
            }
        }
    }
}

// MARK: - UITableViewDataSource
extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRowInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HomeTableViewCell
        let item = viewModel.dataAPISearchs[indexPath.row].url
        viewModel.loadImage(at: indexPath) { (done, error, url) in
            if done, url == item {
                cell.viewModel = self.viewModel.viewModelForCell(at: indexPath)
            }
        }
        return cell
    }
}

// MARK: - UISearchBarDelegate
extension HomeViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let upperText = searchText.uppercased()
        viewModel.titleSearchs = viewModel.titleVideos.filter {
            $0.uppercased().hasPrefix(upperText)
        }
        viewModel.search()
        tableView.reloadData()
    }
}

