//
//  HomeViewController.swift
//  BaiTapTongHop
//
//  Created by PCI0002 on 12/30/19.
//  Copyright © 2019 TranVanTien. All rights reserved.
//

import UIKit

final class HomeViewController: BaseViewController {

    // MARK: - IBOutlet
    @IBOutlet private weak var tableView: UITableView!

    // MARK: - Properties
    private let newsTableViewCell = "NewsTableViewCell"

    // MARK: - config
    override func setupUI() {
        super.setupUI()

        // tableview
        tableView.register(UINib(nibName: newsTableViewCell, bundle: .main), forCellReuseIdentifier: newsTableViewCell)
        tableView.dataSource = self
        tableView.delegate = self
    }
}

// MARK: TableView Datasource
extension HomeViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let newsCell = tableView.dequeueReusableCell(withIdentifier: newsTableViewCell, for: indexPath) as? NewsTableViewCell else { return UITableViewCell() }
        #warning("Config NewsCell!!!")
        newsCell.selectionStyle = .none
        return newsCell
    }
}

// MARK: TableView Delegate
extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let newsDetail = NewsDetailViewController()
        #warning("Config: send link show news")
        pushViewController(viewcontroller: newsDetail)
    }
}
