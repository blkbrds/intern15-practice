//
//  HomeViewController.swift
//  BaiTap12TableView
//
//  Created by Sếp Quân on 4/4/20.
//  Copyright © 2020 QuanBT. All rights reserved.
//

import UIKit

final class HomeViewController: UIViewController {
    // MARK: - IBOutlet
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var textField: UITextField!
    
    // MARK: - Properties
    private var data: [String] = ["one", "two", "three", "four", "five"]
    
    // MARK: - Override
    override func viewDidLoad() {
        super.viewDidLoad()
        configNavigationBar()
        configTableView()
    }
    
    // MARK: - Function
    private func configTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func configNavigationBar() {
        title = "Home"
        turnOffEditingMode()
    }
    
    @objc private func turnOffEditingMode() {
        tableView.isEditing = false
        let editButton = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(turnOnEditingMode))
        textField.isHidden = true
        textField.text = ""
        navigationItem.rightBarButtonItem = editButton
        navigationItem.leftBarButtonItems = []
    }
    
    @objc private func turnOnEditingMode() {
        tableView.isEditing = true
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(turnOffEditingMode))
        let deleteAllButton = UIBarButtonItem(title: "Delete All", style: .plain, target: self, action: #selector(deleteAll))
        textField.isHidden = false
        navigationItem.rightBarButtonItem = doneButton
        navigationItem.leftBarButtonItem = deleteAllButton
    }
    
    @objc private func deleteAll() {
        var message = "Bạn muốn xoá tất cả?"
        let okAction = UIAlertAction(title: "Ok", style: .default) { (action) in
            self.data.removeAll()
            self.tableView.reloadData()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (cancel) in
            self.turnOnEditingMode()
        }
        var actions: [UIAlertAction] = [cancelAction, okAction]
        if data.isEmpty {
            message = "Không có dữ liệu"
            actions = [cancelAction]
        }
        let alert = UIAlertController(title: "Warning", message: message, preferredStyle: .actionSheet)
        actions.forEach { alert.addAction($0) }
        present(alert, animated: true, completion: nil)
    }
}

// MARK: - Extension
extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = data[indexPath.row]
        return cell
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        let result = indexPath.row % 2
        switch result {
        case 0:
            return .delete
        default:
            return .insert
        }
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case .delete:
            tableView.beginUpdates()
            tableView.deleteRows(at: [indexPath], with: .right)
            data.remove(at: indexPath.row)
            tableView.endUpdates()
        case .insert:
            tableView.beginUpdates()
            if let text = textField.text {
                tableView.insertRows(at: [IndexPath(row: indexPath.row + 1, section: indexPath.section)], with: .left)
                data.insert(text, at: indexPath.row + 1)
            }
            tableView.endUpdates()
        default:
            return
        }
    }
}
