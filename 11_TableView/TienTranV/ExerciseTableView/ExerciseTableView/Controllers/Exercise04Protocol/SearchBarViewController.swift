//
//  SearchBarViewController.swift
//  ExerciseTableView
//
//  Created by TranVanTien on 12/4/19.
//  Copyright © 2019 TranVanTien. All rights reserved.
//

import UIKit

final class SearchBarViewController: BaseViewController {
    
    // MARK: - IBOulets
    @IBOutlet private weak var searchBar: UISearchBar!
    @IBOutlet private weak var tableView: UITableView!

    // MARK: - Properties
    private var provinces: [String] = []
    private var provincesData: [String] = []
    private let provinceCell: String = "provinceCell"

    // MARK: - Life Cycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        provinces = provincesData
        tableView.reloadData()
    }
    
    // MARK: - Override funcs
    override func setupUI() {
        super.setupUI()
        configTableView()
        configSearchBar()
    }

    override func setupData() {
        super.setupData()
        provincesData = DummyData.provinceVietNamData
        provinces = provincesData
    }

    // MARK: - Private funcs
    private func configSearchBar() {
        searchBar.delegate = self
    }

    private func configTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: provinceCell)
        tableView.dataSource = self
    }

    private func search(keyword: String) {
        provinces = getContacts(keyword: keyword)
        tableView.reloadData()
    }

    private func getContacts(keyword: String) -> [String] {
        if keyword.trimmingCharacters(in: CharacterSet(charactersIn: " ")) == "", keyword == "" {
            return provincesData
        } else {
            var data: [String] = []
            for contact in provincesData {
                if let _ = contact.range(of: keyword) {
                    data.append(contact)
                }
            }
            return data
        }
    }
}

// MARK: - Extension: UISearchBarDelegate
extension SearchBarViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        var currentTex = ""
        if let searchBarText = searchBar.text {
            currentTex = searchBarText
        }
        let keyword = (currentTex as NSString).replacingCharacters(in: range, with: text)
        search(keyword: keyword)
        return true
    }

    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        searchBar.showsCancelButton = true
        return true
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let keyword = searchBar.text else {
            search(keyword: "")
            return
        }
        search(keyword: keyword)
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        search(keyword: "")
    }
}

// MARK: - Extension: UITableViewDataSource
extension SearchBarViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return provinces.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: provinceCell, for: indexPath)
        cell.textLabel?.text = provinces[indexPath.row]
        return cell
    }
}

// MARK: - DummyData
struct DummyData {
    static var provinceVietNamData: [String] = {
        let provinceVietNamData = ["An Giang", "Bà Rịa - Vũng Tàu", "Bắc Giang", "Bắc Kạn", "Bạc Liêu", "Bắc Ninh", "Bến Tre", "Bình Định", "Bình Dương", "Bình Phước", "Bình Thuận", "Cà Mau", "Cao Bằng", "Đắk Lắk", "Đắk Nông", "Điện Biên", "Đồng Nai", "Đồng Tháp", "Gia Lai", "Hà Giang", "Hà Nam", "Hà Tĩnh", "Hải Dương", "Hậu Giang", "Hòa Bình", "Hưng Yên", "Khánh Hòa", "Kiên Giang", "Kon Tum", "Lai Châu", "Lâm Đồng", "Lạng Sơn", "Lào Cai", "Long An", "Nam Định", "Nghệ An", "Ninh Bình", "Ninh Thuận", "Phú Thọ", "Quảng Bình", "Quảng Nam", "Quảng Ngãi", "Quảng Ninh", "Quảng Trị", "Sóc Trăng", "Sơn La", "Tây Ninh", "Thái Bình", "Thái Nguyên", "Thanh Hóa", "Thừa Thiên Huế", "Tiền Giang", "Trà Vinh", "Tuyên Quang", "Vĩnh Long", "Vĩnh Phúc", "Yên Bái", "Phú Yên", "Cần Thơ", "Đà Nẵng", "Hải Phòng", "Hà Nội", "TP HCM"]
        return provinceVietNamData
    }()
}
