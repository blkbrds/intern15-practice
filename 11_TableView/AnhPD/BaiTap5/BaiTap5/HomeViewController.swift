//
//  HomeViewController.swift
//  BaiTap5
//
//  Created by PCI0012 on 5/15/20.
//  Copyright © 2020 PCI0012. All rights reserved.
//

import UIKit

final class HomeViewController: UIViewController {

    @IBOutlet weak private var searchBar: UISearchBar!
    @IBOutlet weak private var namesTableView: UITableView!
    
    private var names: [String] = []
    var result = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        title = "Search"
        namesTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        namesTableView.dataSource = self
        namesTableView.delegate = self
        searchBar.delegate = self
    }
    
    private func loadData() {
        guard let path = Bundle.main.url(forResource: "Names", withExtension: "plist") else {
            return
        }
        guard let namesData = NSArray(contentsOf: path) as? [String] else {
            return
        }
        names = namesData
        result = names
        
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return result.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = namesTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = result[indexPath.row]
        return cell
    }
}

extension HomeViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            result = names
        } else {
            result = names.filter { $0.prefix(searchText.count) == searchText}
        }
        namesTableView.reloadData()
    }
}
