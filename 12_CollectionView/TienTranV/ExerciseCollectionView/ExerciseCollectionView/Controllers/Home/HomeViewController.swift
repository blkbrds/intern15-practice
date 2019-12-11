//
//  HomeViewController.swift
//  ExerciseCollectionView
//
//  Created by TranVanTien on 12/9/19.
//  Copyright © 2019 TranVanTien. All rights reserved.
//

import UIKit

final class HomeViewController: BaseViewController {

    // MARK: - IBOutlets
    @IBOutlet private weak var tableView: UITableView!

    // MARK: - Properties
    private var exercise: [String] = []

    // MARK: - Override funcs
    override func setupUI() {
        super.setupUI()
        title = "Home"
        configTableview()
    }

    override func setupData() {
        super.setupData()
        exercise.append("Exercise 1")
        exercise.append("Exercise 2")
        exercise.append("Exercise 3")
        exercise.append("Exercise 4")
    }

    // MARK: - Private funcs
    private func configTableview() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.delegate = self
    }
}

// MARK: - UITableViewDataSource
extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exercise.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = exercise[indexPath.row]
        cell.textLabel?.textAlignment = .center
        return cell
    }
}

// MARK: - UITableViewDelegate
extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var viewController = UIViewController()
        switch indexPath.row {
        case 0:
            viewController = ExerciseOneViewController()
            pushViewController(viewcontroller: viewController)
        case 1:
            viewController = ExerciseTwoViewController()
            pushViewController(viewcontroller: viewController)
        case 2:
            viewController = ExerciseThreeViewController()
            pushViewController(viewcontroller: viewController)
        default:
            viewController = ExerciseFourViewController()
            pushViewController(viewcontroller: viewController)
        }
    }
}


