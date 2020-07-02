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
        guard let path = Bundle.main.url(forResource: "ListNames", withExtension: "plist") else { return }
        guard let contactData = NSArray(contentsOf: path) as? [String] else { return }
        contacts = contactData
    }
    
    func search(keyword: String) {
        names = getContacts(keyword: keyword)
        tableView.reloadData()
    }
    
    func getContacts(keyword: String) -> [String] {
        if keyword.trimmingCharacters(in: CharacterSet(charactersIn: "")) == "" {
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
        let vcDetail = DetailViewController()
        vcDetail.name = names[indexPath.row]
        navigationController?.pushViewController(vcDetail, animated: true)
    }
}

extension SearchViewController: UISearchBarDelegate {
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
        guard let keyWord = searchBar.text else {
            search(keyword: "")
            return
        }
        search(keyword: keyWord)
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        search(keyword: "")
    }
}
