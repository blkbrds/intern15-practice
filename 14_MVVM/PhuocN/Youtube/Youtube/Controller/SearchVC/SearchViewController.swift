//
//  SearchViewController.swift
//  abc
//
//  Created by PhuocNguyen on 11/8/19.
//  Copyright © 2019 PhuocNguyen. All rights reserved.
//

import UIKit

final class SearchViewController: BaseViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    private var searchKeys: [String] {
        get {
            return UserDefaults.standard.value(forKey: "SearchKeys") as? [String] ?? []
        } set (newValue) {
            UserDefaults.standard.set(newValue, forKey: "SearchKeys")
        }
    }
    private var searchs: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func setupUI() {
        navigationController?.navigationBar.prefersLargeTitles = false
        let searchController = UISearchController(searchResultsController: nil)
        navigationItem.searchController = searchController
        searchController.automaticallyShowsCancelButton = false
        navigationItem.hidesSearchBarWhenScrolling = false
        
        searchs = searchKeys
        searchController.searchBar.placeholder = "Search"
        searchController.searchBar.tintColor = .white
        searchController.searchBar.delegate = self
        searchController.searchBar.becomeFirstResponder()
        tableView.register(with: UITableViewCell.self)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView(frame: .zero)
    }
}

//MARK: -tableview datasource, delegate
extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(with: UITableViewCell.self, indexPath: indexPath)
        cell.textLabel?.text = searchs[indexPath.row]
        cell.accessoryType = .disclosureIndicator
        cell.backgroundColor = .clear
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = SearchDetailViewController()
        vc.viewModel = SearchDetailViewModel(searchKey: searchs[indexPath.row])
        navigationController?.pushViewController(vc, animated: true)
    }
}

//MARK: -searchBar delegate
extension SearchViewController: UISearchBarDelegate {
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        guard let searchText = searchBar.text, !searchText.isEmpty else { return }
        if searchKeys.count > 20 {
            searchKeys.remove(at: 0)
        }
        if !searchKeys.contains(searchText) {
            searchKeys.append(searchText)
        }
        let vc = SearchDetailViewController()
        vc.viewModel = SearchDetailViewModel(searchKey: searchText)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchs = searchKeys.filter { $0.uppercased().hasPrefix(searchText.uppercased()) }
        tableView.reloadData()
    }
}
