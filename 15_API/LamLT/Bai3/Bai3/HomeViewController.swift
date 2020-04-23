//
//  HomeViewController.swift
//  Bai3
//
//  Created by PCI0002 on 4/22/20.
//  Copyright © 2020 LeThanhLam. All rights reserved.
//

import UIKit

final class HomeViewController: UIViewController {
    // MARK: - IBOutlet
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var searchBar: UISearchBar!
    
    // MARK: - Properties
    private var viewModel = HomeViewModel()
    private var isLoadingMore = false
    
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
        tableView.rowHeight = 100
        loadAPI()
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

// MARK: - UITableViewDataSource ,UITableViewDelegate
extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRowInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HomeTableViewCell
        cell.viewModel = self.viewModel.viewModelForCell(at: indexPath)
        let item = viewModel.dataAPISearchs[indexPath.row]
        viewModel.downloadImage(url: item.url) { (image) in
            if let image = image {
                cell.configImage(image: image)
            } else {
                cell.configImage(image: nil)
            }
        }
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let contentOffset = scrollView.contentOffset.y
        let maximumOffset = scrollView.contentSize.height - scrollView.frame.size.height
        if !isLoadingMore && (maximumOffset - contentOffset <= 100) {
            // Get more data - API call
            loadAPI()
            self.isLoadingMore = true
            // Update UI
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                self.tableView.reloadData()
                self.isLoadingMore = false
            }
        }
    }
}

// MARK: - UISearchBarDelegate
extension HomeViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.isLoadingMore = true
        let upperText = searchText.uppercased()
        viewModel.titleSearchs = viewModel.titleVideos.filter {
            $0.uppercased().hasPrefix(upperText)
        }
        viewModel.search()
        tableView.reloadData()
    }
}


