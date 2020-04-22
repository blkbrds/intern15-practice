//
//  HomeViewController.swift
//  BaiTap2TableView
//
//  Created by Sếp Quân on 4/1/20.
//  Copyright © 2020 QuanBT. All rights reserved.
//

import UIKit

final class HomeViewController: UIViewController {
    // MARK: - IBOutlet
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Properties
    private var viewModel = HomeViewModel()
    
    // MARK: - Override
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "HOME"
        loadData()
        configTableView()
    }
    
    // MARK: - Function
    private func configTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func loadData() {
        viewModel.getData()
    }
}

// MARK: - UITableViewDataSource
extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = viewModel.viewModelForCell(at: indexPath)
        return cell
    }
}

// MARK: - UITableViewDelegate
extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vcDetail = DetailViewController()
        vcDetail.name = viewModel.viewModelForCell(at: indexPath)
        navigationController?.pushViewController(vcDetail, animated: true)
    }
}
