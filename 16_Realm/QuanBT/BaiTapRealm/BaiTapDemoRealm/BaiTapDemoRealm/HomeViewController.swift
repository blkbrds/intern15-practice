//
//  HomeViewController.swift
//  BaiTapDemoRealm
//
//  Created by Sếp Quân on 4/19/20.
//  Copyright © 2020 QuanBT. All rights reserved.
//

import UIKit

final class HomeViewController: UIViewController {
    // MARK: - IBOutlet
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    var viewModel = HomeViewModel()
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchData()
    }
    
    // MARK: - Function
    private func setupView() {
        title = "Category"
        viewModel.addData(title: "Category1", type: 10)
        let nib = UINib(nibName: "HomeTableViewCell", bundle: .main)
        tableView.register(nib, forCellReuseIdentifier: "cell")
        tableView.rowHeight = 100
        tableView.dataSource = self
        let addButton = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .done, target: self, action: #selector(addButtonTouchUpInside))
        navigationItem.leftBarButtonItem = addButton
        let deleteButton = UIBarButtonItem(title: "Delete", style: .done, target: self, action: #selector(deleteButtonTouchUpInside))
        navigationItem.rightBarButtonItem = deleteButton
    }
    
    @objc private func addButtonTouchUpInside() {
        let addVC = AddViewController()
        navigationController?.pushViewController(addVC, animated: true)
    }
    
    @objc private func deleteButtonTouchUpInside() {
        viewModel.deleteAll { (done) in
            if done {
                self.fetchData()
            } else {
                print("Lỗi xoá tất cả đối tượng")
            }
        }
    }
    
    private func fetchData() {
        viewModel.fetchData { (done) in
            if done {
                self.updateUI()
            } else {
                print("Lỗi fetch data từ realm")
            }
        }
    }
    
    private func updateUI() {
        tableView.reloadData()
    }
}

// MARK: - UITableViewDataSource
extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRowInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HomeTableViewCell
        cell.viewModel = viewModel.viewModelForCell(at: indexPath)
        return cell
    }
}
