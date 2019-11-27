//
//  Ex04ViewController.swift
//  BaiTap11
//
//  Created by ANH NGUYỄN on 11/12/19.
//  Copyright © 2019 asiantech. All rights reserved.
//

import UIKit

final class Ex04ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!

    var exercise: Exercise?
    var users: [User] = []
    var arrayUsers: [[String]] = []
    var data: [String] = []
    var doVat: [String] = []
    var traiCay: [String] = []
    var contracsData: [String] = []
    var contracs: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        configSearchbar()
        loadData()
    }

    func setupUI() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.delegate = self
    }
    //lay ra được nhiều file plis
    func loadData() {
        data = Ex04DataManagement.share.getData()
        Ex04DataManagement.share.setFilePlist(name: "traiCayList")
        traiCay = Ex04DataManagement.share.getData()
        Ex04DataManagement.share.setFilePlist(name: "doVatList")
        doVat = Ex04DataManagement.share.getData()
        arrayUsers = [data, traiCay, doVat]
    }

    func configSearchbar() {
        searchBar.delegate = self
    }

    func search(keyword: String) {
        contracs = getContracts(keyword: keyword)
        tableView.reloadData()
        //reload lai du lieu cho search
    }

    func getContracts(keyword: String) -> [String] {
        if keyword.trimmingCharacters(in: CharacterSet(charactersIn: "")) == "" {
            return contracsData
        } else {
            var data: [String] = []
            for contract in contracsData {
                if let _ = contract.range(of: keyword) {
                    data.append(contract)
                }
            }
        }
        return data
    }
}

extension Ex04ViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return arrayUsers.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayUsers[section].count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = arrayUsers[indexPath.section][indexPath.row]
        return cell
    }
    // nhieu section
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Section \(section + 1)"
    }
}
extension Ex04ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        var currentText: String = ""
        if let searchbarText = searchBar.text {
            currentText = searchbarText
        }
        let keyword = (currentText as NSString).replacingCharacters(in: range, with: text)
        search(keyword: keyword)
        return true
    }
    //searchBar click Cance tra về như ban đầu
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        guard let keyWord = searchBar.text else {
            search(keyword: "")
            return
        }
        search(keyword: keyWord)
    }
}
