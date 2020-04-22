//
//  HomeViewController.swift
//  BaiTap5TableView
//
//  Created by Sếp Quân on 4/1/20.
//  Copyright © 2020 QuanBT. All rights reserved.
//

import UIKit

final class HomeViewController: UIViewController {
    // MARK: - IBOutlet
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    // MARK: - Properties
    var contacts: [String] = []
    var names: [String] = []
    
    // MARK: - Override
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "HOME"
        loadData()
        configTableView()
        configSearchBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        names = contacts
        searchBar.text = ""
        tableView.reloadData()
    }
    
    // MARK: - Function
    private func configTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func configSearchBar() {
        searchBar.delegate = self
    }
    
    private func loadData() {
        guard let path = Bundle.main.url(forResource: "name", withExtension: "plist") else {
            return
        }
        guard let contactsData = NSArray(contentsOf: path) as? [String] else {
            return
        }
        contacts = contactsData
    }
    
    private func search(keyword: String) {
        names = getNames(keyword: keyword)
        tableView.reloadData()
    }
    
    private func getNames(keyword: String) -> [String] {
        if keyword.trimmingCharacters(in: CharacterSet(charactersIn: " ")) == "" {
            return contacts
        } else {
            var data: [String] = []
            for name in contacts {
                if let _ = name.range(of: keyword) {
                    data.append(name)
                }
            }
            return data
        }
    }
}

// MARK: - UITableViewDataSource
extension HomeViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "\(names[indexPath.row])"
        return cell
    }
}

// MARK: - UITableViewDelegate
extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vcDetail = DetailViewController()
        vcDetail.name = names[indexPath.row]
        navigationController?.pushViewController(vcDetail, animated: true)
    }
}

// MARK: - UISearchBarDelegate
extension HomeViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        var currentText = ""
        if let searchBarText = searchBar.text {
            currentText = searchBarText
        }
        let keyword = (currentText as NSString).replacingCharacters(in: range, with: text)
        search(keyword: keyword)
        return true
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let keyword = searchBar.text else {
            search(keyword: "")
            return
        }
        search(keyword: keyword)
    }
}
