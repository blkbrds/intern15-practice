//
//  HomeViewController.swift
//  BaiTap11TableView
//
//  Created by Sếp Quân on 4/3/20.
//  Copyright © 2020 QuanBT. All rights reserved.
//

import UIKit

final class HomeViewController: UIViewController {
    // MARK: - IBOutlet
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    private var viewModel = Data()
    
    // MARK: - Override
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
    }
    
    // MARK: - Function
    private func configTableView() {
        let nib = UINib(nibName: "HomeTableViewCell", bundle: Bundle.main)
        tableView.register(nib, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
    }
}

// MARK: - UITableViewDataSource
extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowInSection(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HomeTableViewCell
        cell.viewModel = viewModel.viewModelForCell(at: indexPath)
        return cell
    }
}
