//
//  HomeViewController.swift
//  BaiTapDemoRealm
//
//  Created by Sếp Quân on 4/19/20.
//  Copyright © 2020 QuanBT. All rights reserved.
//

import UIKit
import RealmSwift

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
        let nib = UINib(nibName: "HomeTableViewCell", bundle: .main)
        tableView.register(nib, forCellReuseIdentifier: "cell")
        tableView.rowHeight = 100
        tableView.dataSource = self
        tableView.delegate = self
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
        var message = "Bạn muốn xoá tất cả?"
        let okAction = UIAlertAction(title: "Ok", style: .default) { (action) in
            self.viewModel.deleteAll { (done) in
                if done {
                    self.fetchData()
                } else {
                    print("Lỗi xoá tất cả đối tượng")
                }
            }
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (cancel) in
        }
        
        var actions: [UIAlertAction] = [cancelAction, okAction]
        if viewModel.datas.isEmpty {
            message = "Không có dữ liệu"
            actions = [cancelAction]
        }
        let alert = UIAlertController(title: "Warning", message: message, preferredStyle: .actionSheet)
        actions.forEach { alert.addAction($0) }
        present(alert, animated: true, completion: nil)
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

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            viewModel.deleteItem(item: String(viewModel.datas[indexPath.row].count))
            viewModel.datas.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
        }
    }
}
