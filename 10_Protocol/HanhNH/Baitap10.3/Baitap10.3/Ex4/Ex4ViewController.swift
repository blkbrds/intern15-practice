//
//  Ex4ViewController.swift
//  Baitap10.3
//
//  Created by ANH NGUYỄN on 11/10/19.
//  Copyright © 2019 asiantech. All rights reserved.
//

import UIKit

final class Ex4ViewController: UIViewController {

    private var searchBarLocation: [String] = []
    private var location: [String] = ["Da Nang", "Bình Định", "Bình Dương", "Bình Phước", "Bình Thuận", "Cà Mau", "Cao Bằng", "Đắk Lắk", "Đắk Nông",
        "Điện Biên", "Đồng Nai", "Đồng Tháp", "Gia Lai", "Hà Giang", "Hà Nam", "Hà Tĩnh", "Hải Dương", "Hậu Giang",
        "Hòa Bình", "Hưng Yên", "Khánh Hòa",]
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        setUpUI()
        tableView.dataSource = self
        tableView.delegate = self
        super.viewDidLoad()
        tableView.tableFooterView = UIView(frame: .zero)
        searchBarLocation = location
        searchBar.delegate = self

    }
    func setUpUI() {
        title = "Ex4"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Ex4Cell")
    }
}
extension Ex4ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchBarLocation.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Ex4Cell", for: indexPath)
        cell.textLabel?.text = searchBarLocation[indexPath.row]
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
extension Ex4ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let upperText = searchText.uppercased()
        searchBarLocation = location.filter { $0.uppercased().hasPrefix(upperText) }
        tableView.reloadData()
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBarLocation = location
        searchBar.searchTextField.text = nil
        tableView.reloadData()
    }
}
