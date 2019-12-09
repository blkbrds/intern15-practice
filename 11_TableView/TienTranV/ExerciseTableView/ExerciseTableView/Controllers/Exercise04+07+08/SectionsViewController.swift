//
//  SectionsViewController.swift
//  ExerciseTableView
//
//  Created by PCI0002 on 12/4/19.
//  Copyright © 2019 TranVanTien. All rights reserved.
//

import UIKit

final class SectionsViewController: BaseViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var tableView: UITableView!

    // MARK: - Properties
    private var animals: [String] = []
    private var vegetables: [String] = []
    private var flowers: [String] = []
    private var gardent: [[String]] = []
    private var gardentIndex: [String] = []
    private let cell = "cell"

    // MARK: - Override funcs
    override func setupUI() {
        super.setupUI()
        configTableView()
    }

    override func setupData() {
        super.setupData()
        guard let animals = DataManagement.shared().getDataFromFile(fileName: "Animals", type: "plist"),
            let vegetables = DataManagement.shared().getDataFromFile(fileName: "Vegetables", type: "plist"),
            let flowers = DataManagement.shared().getDataFromFile(fileName: "Flowers", type: "plist") else { return }
        self.animals = animals
        self.flowers = flowers
        self.vegetables = vegetables
        gardent.append(animals)
        gardent.append(flowers)
        gardent.append(vegetables)
        
        gardentIndex = ["A", "F", "V"]
    }

    // MARK: - Privare funcs
    private func configTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cell)
        tableView.dataSource = self    }
}

// MARK: - Extension: UITableViewDataSource
extension SectionsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return gardent.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gardent[section].count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.cell , for: indexPath)
        cell.textLabel?.text = gardent[indexPath.section][indexPath.row]
        let nameLable = UILabel()
        nameLable.frame = CGRect(x: 40, y: 25, width: 500, height: 20)
        nameLable.text = "Thông tin thêm ..."
        nameLable.textColor = .red
        cell.addSubview(nameLable)
        return cell
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Animals"
        case 1:
            return "Flowers"
        default:
            return "Vegetables"
        }
    }

    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return gardentIndex
    }

    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        return index
    }
}
