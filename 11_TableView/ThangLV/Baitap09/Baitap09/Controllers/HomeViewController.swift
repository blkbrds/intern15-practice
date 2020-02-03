//
//  HomeViewController.swift
//  Baitap09
//
//  Created by PCI0008 on 1/14/20.
//  Copyright © 2020 PCI0008. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    private var animals: [String] = []
    private var homeTools: [String] = []
    private var tableViewData: [[String]] = []
    private var titleIndex: [String] = ["A", "H"]
    private let titles: [String] = ["Gia súc", "Đồ vật"]
    
    private let customCell: String = "CustomCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        configTableView()
        tableViewData = [animals, homeTools]
    }
    
    private func loadData() {
        guard let firstPath = Bundle.main.url(forResource: "Animals", withExtension: "plist") else { return }
        guard let animals = NSArray(contentsOf: firstPath) as? [String] else { return }
        self.animals = animals
        guard let secondPath = Bundle.main.url(forResource: "HomeTools", withExtension: "plist") else { return }
        guard let homeTools = NSArray(contentsOf: secondPath) as? [String] else { return }
        self.homeTools = homeTools
    }
    
    private func configTableView() {
        tableView.register(UINib(nibName: customCell, bundle: nil), forCellReuseIdentifier: customCell)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 30
        tableView.dataSource = self
    }
}

extension HomeViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableViewData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewData[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CustomCell = tableView.dequeueReusableCell(withIdentifier: customCell, for: indexPath) as! CustomCell
        cell.userNameLabel?.text = tableViewData[indexPath.section][indexPath.row]
        cell.userNameLabel.textColor = .purple
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return titles[section]
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return titleIndex
    }
}

extension HomeViewController: CustomCellDelegate {
    func cell(cell: CustomCell, needPerform action: CustomCell.Action) {
        switch action {
        case .showUserName(let name):
            print(name)
        }
    }
}


