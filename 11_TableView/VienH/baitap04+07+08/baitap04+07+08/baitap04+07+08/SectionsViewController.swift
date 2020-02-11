//
//  SectionsViewController.swift
//  baitap04+07+08
//
//  Created by user on 12/18/19.
//  Copyright © 2019 VienH. All rights reserved.
//

import UIKit

final class SectionsViewController: BaseViewController {

    // MARK - IBOutlet
    @IBOutlet private weak var tableView: UITableView!

    // MARK: - Properties
    private var animals: [String] = []
    private var vegetables: [String] = []
    private var flowers: [String] = []
    private var gardents: [[String]] = []
    private var gardentIndexs: [String] = []
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
        gardents.append(animals)
        gardents.append(flowers)
        gardents.append(vegetables)
        gardentIndexs = ["A", "F", "V"]
    }

    // MARK: - Private funcs
    private func configTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cell)
        tableView.dataSource = self
    }
}

// MARK: - Extension: UITableViewDataSource
extension SectionsViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return gardents.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gardents[section].count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.cell, for: indexPath)
        cell.textLabel?.text = gardents[indexPath.section][indexPath.row]
        let nameLablel = UILabel()
        nameLablel.frame = Config.nameLabel
        nameLablel.text = Config.titlelabel
        nameLablel.textColor = Config.colorLabel
        cell.addSubview(nameLablel)
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
        return gardentIndexs
    }

    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        return index
    }
}

extension SectionsViewController {
    struct Config {
        static let nameLabel = CGRect(x: 40, y: 25, width: 500, height: 20)
        static let titlelabel = "Information"
        static let colorLabel = UIColor.red
    }
}


