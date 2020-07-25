//
//  SearchViewController.swift
//  TableView
//
//  Created by ADMIN on 6/30/2563 BE.
//  Copyright © 2563 BE asiantech. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    var names: [String] = []
    var contacts: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        configTableView()
        configSearchBar()
        loadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        names = contacts
        searchBar.text = ""
        tableView.reloadData()
    }
    
    func configTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func configSearchBar() {
        searchBar.delegate = self
    }
    
    func loadData() {
        guard let path = Bundle.main.url(forResource: "ListNames", withExtension: "plist"), let contactData = NSArray(contentsOf: path) as? [String]  else { return }
        contacts = contactData
    }
}
extension SearchViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        cell.textLabel?.text = "\(names[indexPath.row])"
        return cell
    }
}
extension SearchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = DetailViewController()
        detailVC.name = names[indexPath.row]
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

extension SearchViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
           if searchText.isEmpty {
               names = contacts
           } else {
               names = contacts.filter { $0.prefix(searchText.count) == searchText}
           }
           tableView.reloadData()
       }
}
