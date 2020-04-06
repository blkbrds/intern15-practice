//
//  SectionViewController.swift
//  BaiTap4TableView
//
//  Created by Sếp Quân on 4/1/20.
//  Copyright © 2020 QuanBT. All rights reserved.
//

import UIKit

final class SectionViewController: UIViewController {
    // MARK: - IBOutlet
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Properties
    private var plants = [[String]()]
    
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
    }
    
    private func configTableView() {
        title = "SECTIONS"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
    }
}

// MARK: - UITableViewDataSource
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
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Section 0"
        case 1:
            return "Section 1"
        default:
            return "Section 2"
        }
    }
}
