//
//  HomeViewController.swift
//  Baitap05
//
//  Created by PCI0008 on 1/13/20.
//  Copyright © 2020 PCI0008. All rights reserved.
//

import UIKit

private struct Config {
    static let cellName: String = "UITableViewCell"
}

final class HomeViewController: UIViewController {
    
    @IBOutlet private weak var searchBar: UISearchBar!
    @IBOutlet private weak var tableView: UITableView!
    
    var names: [String] = []
    var searches: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        configTableView()
        searches = names
        searchBar.delegate = self
    }
    
    private func loadData() {
        guard let path = Bundle.main.url(forResource: "Names", withExtension: "plist") else { return }
        guard let namesData = NSArray(contentsOf: path) as? [String] else { return }
        names = namesData
    }
    
    private func configTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: Config.cellName)
        tableView.dataSource = self
    }
}

extension HomeViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Config.cellName, for: indexPath)
        cell.textLabel?.text = "\(names[indexPath.row])"
        return cell
    }
    
    
}

extension HomeViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let upperText = searchText.uppercased()
        searches = names.filter { $0.uppercased().hasPrefix(upperText) }
        tableView.reloadData()
    }
}
