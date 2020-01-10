//
//  HomeViewController.swift
//  Baitap03
//
//  Created by PCI0008 on 12/12/19.
//  Copyright © 2019 PCI0008. All rights reserved.
//

import UIKit

final class HomeViewController: UIViewController {
    
    @IBOutlet private weak var searchBar: UISearchBar!
    @IBOutlet private weak var provinceTableView: UITableView!
    
    private var searchs: [String] = []
    private let provinces: [String] = ["An Giang", "Bắc Giang", "Bạc Liêu", "Bến Tre", "Bình Dương", "Bình Thuận", "Cao Bằng", "Đắk Nông", "Đồng Nai", "Gia Lai", "Hà Nam", "Hải Dương", "Hòa Bình", "Khánh Hòa", "Kon Tum", "Lâm Đồng", "Lào Cai", "Nam Định", "Nam Định", "Phú Thọ", "Quảng Nam", "Quảng Ninh", "Sóc Trăng", "Tây Ninh", "Thái Nguyên", "Thừa Thiên Huế", "Trà Vinh", "Vĩnh Long", "Yên Bái", "Cần Thơ", "Hải Phòng", "TP HCM", "Đà Nẵng", "Hải Phòng", "Hà Nội"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchs = provinces
        setupUI()
    }
    
    func setupUI() {
        self.title = "Search"
        provinceTableView.register(UITableViewCell.self, forCellReuseIdentifier: "ChoPhuoc")
        provinceTableView.dataSource = self
        provinceTableView.delegate = self
        searchBar.delegate = self
        searchBar.placeholder = "Search city"
    }
    
    @IBAction func touchUpInsideCancelButton(_ sender: Any) {
        searchBarCancelButtonClicked(searchBar)
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChoPhuoc", for: indexPath)
        cell.textLabel?.text = searchs[indexPath.row]
        return cell
    }
}

extension HomeViewController: UISearchBarDelegate {
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = nil
        searchs = provinces
        searchBar.resignFirstResponder()
        provinceTableView.reloadData()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let upperText = searchText.uppercased()
        searchs = provinces.filter { $0.uppercased().hasPrefix(upperText) }
        provinceTableView.reloadData()
    }
}

