//
//  HomeViewController.swift
//  BaiTap4Protocol
//
//  Created by Sếp Quân on 3/31/20.
//  Copyright © 2020 QuanBT. All rights reserved.
//

import UIKit

final class HomeViewController: UIViewController {
    // MARK: - IBOutlet
    @IBOutlet private weak var searchBar: UISearchBar!
    @IBOutlet private weak var listLocalTableView: UITableView!
    
    // MARK: - Properties
    private var searchLocations: [String] = []
    private let locations: [String] = ["An Giang", "Bà Rịa - Vũng Tàu", "Bắc Giang", "Bắc Kạn", "Bạc Liêu", "Bắc Ninh", "Bến Tre", "Bình Định", "Bình Dương", "Bình Phước", "Bình Thuận", "Cà Mau", "Cao Bằng", "Đắk Lắk", "Đắk Nông", "Điện Biên", "Đồng Nai", "Đồng Tháp", "Gia Lai", "Hà Giang", "Hà Nam", "Hà Tĩnh", "Hải Dương", "Hậu Giang", "Hòa Bình", "Hưng Yên", "Khánh Hòa", "Kiên Giang", "Kon Tum", "Lai Châu", "Lâm Đồng", "Lạng Sơn", "Lào Cai", "Long An", "Nam Định", "Nghệ An", "Ninh Bình", "Ninh Thuận", "Phú Thọ", "Quảng Bình","Quảng Nam", "Quảng Ngãi", "Quảng Ninh", "Quảng Trị", "Sóc Trăng", "Sơn La", "Tây Ninh", "Thái Bình", "Thái Nguyên", "Thanh Hóa", "Thừa Thiên Huế", "Tiền Giang", "Trà Vinh", "Tuyên Quang", "Vĩnh Long", "Vĩnh Phúc", "Yên Bái", "Phú Yên"]
    
    // MARK: - Override
    override func viewDidLoad() {
        super.viewDidLoad()
        listLocalTableView.delegate = self
        listLocalTableView.dataSource = self
        listLocalTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        listLocalTableView.tableFooterView = UIView(frame: .zero)
        searchLocations = locations
        searchBar.delegate = self
    }
}

// MARK: - Extension
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchLocations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = searchLocations[indexPath.row]
        return cell
    }
}

extension HomeViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let upperText = searchText.uppercased()
        searchLocations = locations.filter {
            $0.uppercased().hasPrefix(upperText)
        }
        listLocalTableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchLocations = locations
        searchBar.searchTextField.text = nil
        listLocalTableView.reloadData()
    }
}
