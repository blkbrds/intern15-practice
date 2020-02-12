//
//  HomeViewController.swift
//  baitap11.1
//
//  Created by user on 12/18/19.
//  Copyright © 2019 VienH. All rights reserved.
//

import UIKit

final class HomeViewController: UIViewController {
    private var names: [String] = ["name1", "name2", "name3", "name4", "name5"]
    private let contactsCell: String = "cell"

    //MARK: - IBOutlet
    @IBOutlet private weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"

        // register cell
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: contactsCell)
        tableView.dataSource = self
    }
}

//MARK: - Extension: UITableViewDataSource
extension HomeViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: contactsCell, for: indexPath)
        cell.textLabel?.text = names[indexPath.row]
        return cell
    }
}



