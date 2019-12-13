//
//  DetailViewController.swift
//  TableView
//
//  Created by PCI0018 on 11/12/19.
//  Copyright © 2019 Asian Tech. All rights reserved.
//

import UIKit

protocol DetailViewControllerDataSource: class {
    func getName() -> String?
}

final class DetailViewController: UIViewController {

    @IBOutlet private weak var nameLabel: UILabel!

    weak var dataSource: DetailViewControllerDataSource?

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Detail"
        setupData()
    }

    //MARK: - Private function
    private func setupData() {
        guard let name = dataSource?.getName() else { return }
        nameLabel.text = name
    }
}
