//
//  HomeViewController.swift
//  Baitap3API
//
//  Created by ADMIN on 7/28/2563 BE.
//  Copyright © 2563 BE asiantech. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel = HomeViewModel()
    private var isLoadingMore = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
        
    }
    func configTableView() {
        let nib = UINib(nibName: "HomeTableViewCell", bundle: .main)
        tableView.register(nib, forCellReuseIdentifier: "tableView")
        tableView.dataSource = self
        tableView.rowHeight = 100
        loadAPI()
        tableView.delegate = self
        searchBar.delegate = self
        
    }
    func loadAPI() {
        print("load API")
        viewModel.loadAPI { (done, msg) in
            if done {
                self.viewModel.dataAPISearch = self.viewModel.dataAPI
                self.tableView.reloadData()
            } else {
                print("API Error: \(msg)")
            }
        }
    }
}
extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableView", for: indexPath) as! HomeTableViewCell
        cell.viewModel = self.viewModel.viewModelForCell(at: indexPath)
        let item = viewModel.dataAPISearch[indexPath.row]
        viewModel.loadImage(url: item.url) { (image) in
            if let image = image {
                cell.configImage(image: image)
            } else {
                cell.configImage(image: nil)
            }
        }
        return cell
    }
    
}
extension HomeViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.isLoadingMore = true
        let upperText = searchText.uppercased()
        viewModel.titleSearch = viewModel.titleVideos.filter {
            $0.uppercased().hasPrefix(upperText)
        }
        viewModel.search()
        tableView.reloadData()
    }
}
extension HomeViewController: UITableViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let contentOffset = scrollView.contentOffset.y
        let maximumOffset = scrollView.contentSize.height - scrollView.frame.size.height
        if !isLoadingMore && (maximumOffset - contentOffset <= 100) {
            loadAPI()
            self.isLoadingMore = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                self.tableView.reloadData()
                self.isLoadingMore = false
            }
        }
    }
}
