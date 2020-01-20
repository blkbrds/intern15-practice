//
//  Ex4ViewController.swift
//  baitap4
//
//  Created by user on 12/25/19.
//  Copyright © 2019 VienH. All rights reserved.
//

import UIKit

class Ex4ViewController: UIViewController {


    @IBOutlet weak var tableView: UITableView!
    private let teams: [Team] = [.pull, .poodle, .alaska]
    private let homeTableViewCell = "HomeTableViewCell"
    private let sliderTableViewCell = "SliderTableViewCell"

    // MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }

    // MARK: - config
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: homeTableViewCell, bundle: Bundle.main), forCellReuseIdentifier: homeTableViewCell)
        tableView.register(UINib(nibName: sliderTableViewCell, bundle: Bundle.main), forCellReuseIdentifier: sliderTableViewCell)
    }
}

// MARK: - tableview datasource, tableview delegate
extension Ex4ViewController: UITableViewDataSource, UITableViewDelegate {

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
            guard let cell = tableView.dequeueReusableCell(withIdentifier: sliderTableViewCell, for: indexPath) as? SliderTableViewCell else { return UITableViewCell() }
            cell.data = teams.map { $0.teamAvatar }
            return cell
        }
        guard let cell = tableView.dequeueReusableCell(withIdentifier: homeTableViewCell, for: indexPath) as? HomeTableViewCell else {
            return UITableViewCell()
        }
        cell.data = teams[indexPath.section - 1].members
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.section == 0 ? 300 : 200
    }
}
