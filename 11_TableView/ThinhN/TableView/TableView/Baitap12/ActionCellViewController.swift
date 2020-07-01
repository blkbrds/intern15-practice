//
//  ActionCellViewController.swift
//  TableView
//
//  Created by PCI0019 on 7/1/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

class ActionCellViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var numbersValue: [String] = []
    var cheking: Bool = true
    var selectedIndexes = [[IndexPath.init(row: 0, section: 0)], [IndexPath.init(row: 0, section: 1)]]
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isEditing = false
        tableView.allowsMultipleSelection = true
        configNavigationBar()
    }
    
    func configNavigationBar() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "ChangeActive", style: UIBarButtonItem.Style.plain, target: self, action: #selector(buttonTouchUpInside))
    }
    @objc func buttonTouchUpInside () {
        if cheking {
            tableView.isEditing = cheking
            cheking = false
        } else {
            tableView.isEditing = cheking
            cheking = true
        }
        tableView.isEditing = true
    }
    func loadData() {
        guard let path = Bundle.main.url(forResource: "ListNumber", withExtension: "plist") else { return }
        guard let contactData = NSArray(contentsOf: path) as? [String] else { return }
        numbersValue = contactData
    }
}
extension ActionCellViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numbersValue.count
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.accessoryType = .none
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.accessoryType = .checkmark
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "\(indexPath.row + 1)"
        if let cell = tableView.cellForRow(at: indexPath) {
               cell.accessoryType = .checkmark
           }
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = UIContextualAction(style: UIContextualAction.Style.normal, title: "Delete") { (action, view, completionHandler) in completionHandler(true)
        }
        delete.image = UIImage(systemName: "list")
        delete.backgroundColor = .red
        let swipe = UISwipeActionsConfiguration(actions: [delete])
        return swipe
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let item = numbersValue[sourceIndexPath.row]
        numbersValue.remove(at: sourceIndexPath.row)
        numbersValue.insert(item, at: destinationIndexPath.row)
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .none
    }
    
    func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        return false
    }
}
