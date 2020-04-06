//
//  HomeViewController.swift
//  BaiTap10TableView
//
//  Created by Sếp Quân on 4/4/20.
//  Copyright © 2020 QuanBT. All rights reserved.
//

import UIKit

final class HomeViewController: UIViewController {
    // MARK: - IBOutlet
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    private var gardenIndex: [String] = []
    private var users: [[User]] = []
    
    // MARK: - Override
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        configTableView()
    }
    
    // MARK: - Function
    private func loadData() {
        gardenIndex = ["A", "B", "V"]
        users = User.getUser()
    }
    
    private func configTableView() {
        title = "SECTIONS"
        let nib = UINib(nibName: "HomeTableViewCell", bundle: Bundle.main)
        tableView.register(nib, forCellReuseIdentifier: "HomeTableViewCell")
        tableView.dataSource = self
        tableView.rowHeight = 100
    }
}

// MARK: - UITableViewDataSource
extension HomeViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as! HomeTableViewCell
        cell.avatarImageView.image = UIImage(named: users[indexPath.section][indexPath.row].imageUser)
        cell.nameLabel.text = users[indexPath.section][indexPath.row].nameUser
        cell.subTitleLabel.text = users[indexPath.section][indexPath.row].subTitle
        cell.detegale = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "A"
        case 1:
            return "B"
        default:
            return "V"
        }
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return gardenIndex
    }
    
    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        return index
    }
}

// MARK: - HomeTableViewCellDelegate
extension HomeViewController: HomeTableViewCellDelegate {
    func tapMe(_ homeTableViewCell: HomeTableViewCell) {
        var userName = ""
        if let name = homeTableViewCell.nameLabel.text {
            userName = name
        }
        print("Make call to \(userName)")
    }
}
