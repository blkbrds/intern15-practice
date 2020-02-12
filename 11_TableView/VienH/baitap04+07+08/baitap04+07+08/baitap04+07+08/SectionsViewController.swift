//
//  SectionsViewController.swift
//  baitap04+07+08
//
//  Created by user on 12/18/19.
//  Copyright © 2019 VienH. All rights reserved.
//

import UIKit

final class SectionsViewController: BaseViewController {

    enum SectionStyle: Int {
        case animals = 0
        case vegetables
        case flowers

        var stringValue: String {
            switch self {
            case .animals:
                return "Animals"
            case .vegetables:
                return "Vegetables"
            default:
                return "Flowers"
            }
        }
    }

    // MARK - IBOutlet
    @IBOutlet private weak var tableView: UITableView!

    // MARK: - Properties
    private var animals: [String] = []
    private var vegetables: [String] = []
    private var flowers: [String] = []
    private var gardents: [[String]] = []
    private var gardentIndexs: [String] = []
    private let listAnimal = "cell"

    // MARK: - Override funcs
    override func setupUI() {
        super.setupUI()
        configTableView()
    }

    override func setupData() {
        super.setupData()
        guard let animals = DataManagement.shared().getDataFromFile(fileName: SectionStyle.animals.stringValue, type: "plist"),
            let vegetables = DataManagement.shared().getDataFromFile(fileName: SectionStyle.vegetables.stringValue, type: "plist"),
            let flowers = DataManagement.shared().getDataFromFile(fileName: SectionStyle.flowers.stringValue, type: "plist") else { return }
        self.animals = animals
        self.flowers = flowers
        self.vegetables = vegetables
        gardents.append(animals)
        gardents.append(vegetables)
        gardents.append(flowers)
        gardentIndexs = ["A", "V", "F"]
    }

    // MARK: - Private funcs
    private func configTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: listAnimal)
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
        let cell = tableView.dequeueReusableCell(withIdentifier: self.listAnimal, for: indexPath)
        cell.textLabel?.text = gardents[indexPath.section][indexPath.row]
        let nameLabel = UILabel()
        nameLabel.frame = Config.nameLabel
        nameLabel.text = Config.titlelabel
        nameLabel.textColor = Config.colorLabel
        cell.addSubview(nameLabel)
        return cell
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let title = SectionStyle(rawValue: section) else { return "" }
        switch title {
        case .animals:
            return SectionStyle.animals.stringValue
        case .vegetables:
            return SectionStyle.vegetables.stringValue
        default:
            return SectionStyle.flowers.stringValue
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


