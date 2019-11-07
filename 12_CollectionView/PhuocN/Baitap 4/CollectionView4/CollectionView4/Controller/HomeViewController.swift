//
//  HomeViewController.swift
//  CollectionView4
//
//  Created by PhuocNguyen on 10/22/19.
//  Copyright © 2019 PhuocNguyen. All rights reserved.
//

import UIKit

final class HomeViewController: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet private weak var tableView: UITableView!
    
    private let teams: [Team] = [.avengers, .guardians, .xmen]
    
    // MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    // MARK: - config
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "HomeTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "HomeCell")
        tableView.register(UINib(nibName: "SliderTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "SliderCell")
    }
}

// MARK: - tableview datasource, tableview delegate
extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return teams.count + 1
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return nil
        }
        return teams[section - 1].teamName
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard indexPath.section > 0 else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "SliderCell", for: indexPath) as? SliderTableViewCell else { return UITableViewCell() }
            cell.data = teams.map { $0.teamAvatar }
            return cell
        }
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HomeCell", for: indexPath) as? HomeTableViewCell else {
            fatalError("Don't have this cell")
        }
        cell.data = teams[indexPath.section - 1].members
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.section == 0 ? 300 : 200
    }
}
