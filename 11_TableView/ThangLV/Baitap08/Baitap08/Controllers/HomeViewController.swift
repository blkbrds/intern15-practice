//
//  HomeViewController.swift
//  Baitap08
//
//  Created by PCI0008 on 1/14/20.
//  Copyright © 2020 PCI0008. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let animals: [String] = ["Ngựa", "Gà", "Vịt", "Cá", "Trâu", "Bò", "Heo"]
    let homeTools: [String] = ["Tivi", "Dao", "Kéo", "Xe", "Chén", "Bát", "Kềm", "Búa", "Đinh"]
    var tableViewData: [[String]] = []
    let titles: [String] = ["Gia súc", "Đồ vật"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewData = [animals, homeTools]
        configTableView()
    }
    
    private func configTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        cell.textLabel?.text = tableViewData[indexPath.section][indexPath.row]
        let nameLabel = UILabel()
        nameLabel.frame = CGRect(x: 70, y: 25, width: 500, height: 20)
        nameLabel.text = "Name"
        nameLabel.textColor = .red
        cell.addSubview(nameLabel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return titles[section]
    }
}
