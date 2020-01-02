//
//  BaseHomeChildViewController.swift
//  BaiTapTongHop
//
//  Created by TranVanTien on 1/1/20.
//  Copyright © 2020 TranVanTien. All rights reserved.
//

import UIKit

protocol BaseHomeChildViewControllerDelegate: class {
    func viewController(viewController: BaseHomeChildViewController, needPerform action: BaseHomeChildViewController.Action)
}

final class BaseHomeChildViewController: BaseViewController {

    enum Action {
        case currentPage(index: Int)
    }

    enum ScreenType: Int, CaseIterable {
        case us
        case business
        case technology
        case health
        case science
        case sports
        case entertainment

        var category: String {
            switch self {
            case .us:
                return "general"
            case .business:
                return "business"
            case .technology:
                return "technology"
            case .health:
                return "health"
            case .science:
                return "science"
            case .sports:
                return "sports"
            case .entertainment:
                return "entertainment"
            }
        }
    }

    // MARK: - IBOutlet
    @IBOutlet weak var tableView: UITableView!

    // MARK: - Properties
    var screenType: ScreenType = .us
    private let newsTableViewCell = "NewsTableViewCell"

    // MARK: - config
    override func setupUI() {
        super.setupUI()
        configTableView()
    }

    // MARK: - Private funcs
    private func configTableView() {

        // tableview
        tableView.register(UINib(nibName: newsTableViewCell, bundle: .main), forCellReuseIdentifier: newsTableViewCell)
        tableView.dataSource = self
        tableView.delegate = self
    }
}

// MARK: TableView Datasource
extension BaseHomeChildViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let newsCell = tableView.dequeueReusableCell(withIdentifier: newsTableViewCell, for: indexPath) as? NewsTableViewCell else { return UITableViewCell() }
//        #warning("Config NewsCell!!!")
        newsCell.selectionStyle = .none
        return newsCell
    }
}

// MARK: TableView Delegate
extension BaseHomeChildViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch screenType.rawValue % 3 {
        case 0:
            return 200
        case 1:
            return 160
        default:
            return 250
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let newsDetail = NewsDetailViewController()
//        #warning("Config: send link show news")
        pushViewController(viewcontroller: newsDetail)
    }
}
