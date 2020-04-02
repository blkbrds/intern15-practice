//
//  SectionViewController.swift
//  BaiTap7_8TableView
//
//  Created by Sếp Quân on 4/2/20.
//  Copyright © 2020 QuanBT. All rights reserved.
//

import UIKit

final class SectionViewController: UIViewController {
    // MARK: - IBOutlet
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Properties
    private var plants = [[String]()]
    private var gardenIndex: [String] = []
    
    // MARK: - Override
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        configTableView()
    }
    
    // MARK: - Function
    private func loadData() {
        guard let path = Bundle.main.url(forResource: "Sections", withExtension: "plist") else {
            return
        }
        guard let data = NSArray(contentsOf: path) else {
            return
        }
        plants = data as! [[String]]
        gardenIndex = ["T", "G", "Đ"]
    }
    
    private func configTableView() {
        title = "SECTIONS"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
    }
}

// MARK: - Extension
extension SectionViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return plants.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return plants[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = plants[indexPath.section][indexPath.row]
        let label = UILabel(frame: CGRect(x: 40, y: 30, width: 100, height: 20))
        label.text = "Name"
        label.textColor = .red
        cell.addSubview(label)
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Thức Ăn"
        case 1:
            return "Gia Súc"
        default:
            return "Đồ Vật"
        }
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return gardenIndex
    }
    
    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        return index
    }
}
