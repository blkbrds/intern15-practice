//
//  HomeViewController.swift
//  CollectionView4
//
//  Created by PhuocNguyen on 10/22/19.
//  Copyright © 2019 PhuocNguyen. All rights reserved.
//

import UIKit

final class HomeViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "HomeTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "HomeCell")
        tableView.register(UINib(nibName: "SliderTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "SliderCell")
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return Team.count + 1
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return nil
        }
        guard let team = Team(rawValue: section - 1) else {
            fatalError("Team is nil")
        }
        return team.teamName
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard indexPath.section > 0 else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SliderCell", for: indexPath) as! SliderTableViewCell
            cell.data = Team.teamAvatar
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeCell", for: indexPath) as! HomeTableViewCell
        guard let team = Team(rawValue: indexPath.section - 1) else {
            fatalError("Team is nil")
        }
        cell.data = team.members
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.section == 0 ? 300 : 200
    }
}
