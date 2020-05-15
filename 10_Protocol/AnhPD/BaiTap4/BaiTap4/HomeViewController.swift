//
//  HomeViewController.swift
//  BaiTap4
//
//  Created by PCI0012 on 5/8/20.
//  Copyright © 2020 PCI0012. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var names: [String] = ["Đà Nẵng","Sài Gòn","Quảng Nam","Quảng Ngãi","Bình Định","Phú Yên","Bình Thuận","Khánh Hoà","Lâm Đồng","Kontum","Đắc lắc","Ninh Thuận", "Huế", "Quảng Trị", "Quảng Bình", "Hà Tĩnh", "Nghệ An", "Thanh Hoá","Hà Nội","Quảng Ninh", "Sơn La", "Cao Bằng", "Lạng Sơn", "Bắc Ninh","Cà Mau", "An Giang", "Tây Ninh", "Sóc Trăng", "Vĩnh Long"]
    var searchName: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        title = "Home"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
        searchName = names
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate	 {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = searchName[indexPath.row]
        return cell
    }
}

extension HomeViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchName = names.filter({$0.prefix(searchText.count) == searchText})
        tableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        searchName = names
        tableView.reloadData()
    }
}
