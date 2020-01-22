//
//  HomeViewController.swift
//  BaiTapRealm
//
//  Created by ANH NGUYỄN on 1/22/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

final class HomeViewController: BaseViewController {

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
    }

    override func setupNavigation() {
        title = "Home"
    }

    func configTableView() {
        tableView.register(name: CellIdentifier.homeTableViewCell.rawValue)
        tableView.delegate = self
        tableView.dataSource = self
    }
}
extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.homeTableViewCell.rawValue, for: indexPath) as? HomeTableViewCell else { return UITableViewCell() }
        return cell
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}
