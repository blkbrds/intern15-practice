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
    var checking: Bool = true
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
        let changeActive = UIBarButtonItem(image: UIImage(systemName: "list.dash"), style: UIBarButtonItem.Style.plain, target: self, action: #selector(changeActiveButtonTouchUpInside))
        let delete  = UIBarButtonItem(image: UIImage(systemName: "trash"), style: UIBarButtonItem.Style.plain, target: self, action: #selector(deleteButtonTouchUpInside))
        navigationItem.leftBarButtonItems = [changeActive, delete]
    }
    
    @objc func deleteButtonTouchUpInside() {
        
        if let selectRow = tableView.indexPathsForSelectedRows {
            var items = [String]()
            for indexPath in selectRow {
                items.append(numbersValue[indexPath.row])
            }
            for item in items {
                if let index = numbersValue.firstIndex(of: item) {
                    numbersValue.remove(at: index)
                }
            }
            tableView.deleteRows(at: selectRow, with: .automatic)
        }
    }
    
    @objc func changeActiveButtonTouchUpInside () {
        if checking {
            tableView.isEditing = checking
            checking = false
        } else {
            tableView.isEditing = checking
            checking = true
        }
    }
    
    func loadData() {
        guard let path = Bundle.main.url(forResource: "ListNumber", withExtension: "plist"), let contactData = NSArray(contentsOf: path) as? [String] else { return }
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
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.numbersValue.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "\(indexPath.row + 1)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = UIContextualAction(style: UIContextualAction.Style.normal, title: "Delete") { (action, view, completionHandler) in
            self.numbersValue.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            completionHandler(true)
        }
        delete.image = UIImage(systemName: "trash")
        delete.backgroundColor = .red
        let insert = UIContextualAction(style: .normal, title: "Insert") { (action, view, completionHandler) in
            self.numbersValue.insert("new", at: indexPath.row)
            tableView.insertRows(at: [indexPath], with: .fade)
            completionHandler(true)
        }
        let swipe = UISwipeActionsConfiguration(actions: [delete, insert])
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
