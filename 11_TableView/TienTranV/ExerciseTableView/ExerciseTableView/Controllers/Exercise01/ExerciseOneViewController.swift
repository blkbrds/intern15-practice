//
//  ExerciseOneViewController.swift
//  ExerciseTableView
//
//  Created by PCI0002 on 12/4/19.
//  Copyright © 2019 TranVanTien. All rights reserved.
//

import UIKit

final class ExerciseOneViewController: BaseViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Override funcs
    override func setupUI() {
        configTableView()
    }
    
    // MARK: - Private funcs
    private func configTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
    }
}

// MARK: - Extension: UITableViewDataSource
extension ExerciseOneViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "Name \(indexPath.row + 1)"
        return cell
    }
}
