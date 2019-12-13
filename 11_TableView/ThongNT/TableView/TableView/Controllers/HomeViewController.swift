//
//  HomeViewController.swift
//  TableView
//
//  Created by PCI0018 on 11/12/19.
//  Copyright © 2019 Asian Tech. All rights reserved.
//

import UIKit

final class HomeViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var searchBar: UISearchBar!

    private var users: [String] = []
    private var searchResult: [String] = []
    private var nameSelected: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Contacts"
        searchBar.delegate = self
        configTableView()
        setupData()
    }

    //MARK: - Private functions
    private func configTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        turnOffEditingMode()
    }

    private func setupData() {
        users = ContactDatamagement.share.getData()
        searchResult = users
    }

    //MARK: - @objc private functions
    @objc private func turnOnEditingMode() {
        tableView.isEditing = true
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(turnOffEditingMode))
        let deteleAllButton = UIBarButtonItem(title: "Delete All", style: .done, target: self, action: #selector(deleteAllCells))
        navigationItem.rightBarButtonItem = doneButton
        navigationItem.leftBarButtonItem = deteleAllButton
    }

    @objc private func turnOffEditingMode() {
        tableView.isEditing = false
        let editButton = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(turnOnEditingMode))
        let sectionButton = UIBarButtonItem(title: "Section", style: .plain, target: self, action: #selector(gotoSectionVC))
        navigationItem.leftBarButtonItem = editButton
        navigationItem.rightBarButtonItem = sectionButton
    }

    @objc private func deleteAllCells() {
        var message: String = "Sao mà xoá hết vậy honey?"
        // define actions
        let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
            self.searchResult.removeAll()
            self.tableView.reloadData()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        var actions: [UIAlertAction] = [cancelAction, okAction]
        // check condition
        if searchResult.isEmpty {
            message = "Không có gì để xoá bạn à!"
            actions = [cancelAction]
        }
        // add actions
        let alert = UIAlertController(title: "Warning", message: message, preferredStyle: .actionSheet)
        actions.forEach { alert.addAction($0) }
        present(alert, animated: true, completion: nil)
    }

    @objc private func gotoSectionVC() {
        navigationController?.pushViewController(SectionsViewController(), animated: true)
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {

    // setup editStyle
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }

    // action of edit from user
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // removew element in array before tableview.deleteRow
            searchResult.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .left)
        }
    }

    // allow to reorder row in tableView
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let movedObject = searchResult[sourceIndexPath.row]
        searchResult.remove(at: sourceIndexPath.row)
        searchResult.insert(movedObject, at: destinationIndexPath.row)
    }

    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let contextItem = UIContextualAction(style: .normal, title: "Insert") { (contextualAction, view, boolValue) in
            // add alert
            let alert = UIAlertController(title: "Insert", message: "Insert Confirmed", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { (action) in
                alert.dismiss(animated: true, completion: nil)
            }))
            self.present(alert, animated: true, completion: nil)
        }
        contextItem.backgroundColor = #colorLiteral(red: 0, green: 0.5603182912, blue: 0, alpha: 1)
        let swipeConfig = UISwipeActionsConfiguration(actions: [contextItem, contextItem])
        return swipeConfig
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResult.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = searchResult[indexPath.row]
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        view.endEditing(true)
        nameSelected = searchResult[indexPath.row]
        let detailViewController = DetailViewController()
        detailViewController.dataSource = self
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}

extension HomeViewController: DetailViewControllerDataSource {
    func getName() -> String? {
        return nameSelected
    }
}

extension HomeViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let upperText = searchText.uppercased()
        searchResult = users.filter { $0.uppercased().hasPrefix(upperText) }
        tableView.reloadData()
    }
}
