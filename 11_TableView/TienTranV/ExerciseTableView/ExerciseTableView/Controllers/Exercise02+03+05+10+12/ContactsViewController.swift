//
//  ExerciseTwoViewController.swift
//  ExerciseTableView
//
//  Created by PCI0002 on 12/4/19.
//  Copyright © 2019 TranVanTien. All rights reserved.
//

import UIKit

final class ContactsViewController: BaseViewController {

    // MARK: - IBOulets
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var searchBar: UISearchBar!

    // MARK: - Properties
    private var contacts: [String] = []
    private var contactsData: [String] = []
    private let contactCell: String = "contactCell"

    // MARK: - Life Cycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        contacts = contactsData
        tableView.reloadData()
    }

    // MARK: - Override funcs
    override func setupUI() {
        super.setupUI()
        configTableView()
        configSearchBar()
        configNavigationBar()
    }

    override func setupData() {
        super.setupData()
        guard let contactsData = DataManagement.shared().getDataFromFile(fileName: "Contacts", type: "plist") else { return }
        self.contactsData = contactsData
        contacts = contactsData
    }

    // MARK: - Private funcs
    private func configSearchBar() {
        searchBar.delegate = self
    }

    private func configTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: contactCell)
        tableView.dataSource = self
        tableView.delegate = self
    }
    private func search(keyword: String) {
        contacts = getContacts(keyword: keyword)
        tableView.reloadData()
    }

    private func getContacts(keyword: String) -> [String] {
        if keyword.trimmingCharacters(in: CharacterSet(charactersIn: " ")) == "", keyword == "" {
            return contactsData
        } else {
            var data: [String] = []
            for contact in contactsData {
                if let _ = contact.range(of: keyword) {
                    data.append(contact)
                }
            }
            return data
        }
    }

    private func configNavigationBar() {
        title = "Home"
        turnOffEditingMode()
    }

    @objc private func turnOffEditingMode() {
        tableView?.isEditing = false
        let editButtonBarItem = UIBarButtonItem(title: "Edit", style: .done, target: self, action: #selector(turnOnEditingMode))
        navigationItem.rightBarButtonItems = [editButtonBarItem]
        navigationItem.leftBarButtonItems = []
    }

    @objc private func turnOnEditingMode() {
        tableView?.isEditing = true
        let editButtonBarItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(turnOffEditingMode))
        let deleteAllButtonBarItem = UIBarButtonItem(title: "Delete All", style: .done, target: self, action: #selector(deleteAllCell))
        navigationItem.rightBarButtonItem = editButtonBarItem
        navigationItem.leftBarButtonItem = deleteAllButtonBarItem
    }

    @objc private func deleteAllCell() {
        var message = "Bạn có chắc chắn muốn xoá tất cả❓"

        // Define actions
        let okAction = UIAlertAction(title: "Ok", style: .default) { (action) in
            self.contacts.removeAll()
            self.tableView.reloadData()
        }

        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (cancel) in
            self.turnOnEditingMode()
        }

        var actions: [UIAlertAction] = [cancelAction, okAction]
        // Check condition
        if contacts.isEmpty {
            message = "❌ Không có dữ liệu ❌"
            actions = [cancelAction]
        }

        // Add actions
        let alert = UIAlertController(title: "‼️ Warning ‼️", message: message, preferredStyle: .actionSheet)

        actions.forEach { alert.addAction($0) }
        present(alert, animated: true, completion: nil)

    }
}

// MARK: - Extension: UISearchBarDelegate
extension ContactsViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        var currentTex = ""
        if let searchBarText = searchBar.text {
            currentTex = searchBarText
        }
        let keyword = (currentTex as NSString).replacingCharacters(in: range, with: text)
        search(keyword: keyword)
        return true
    }

    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        searchBar.showsCancelButton = true
        return true
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let keyword = searchBar.text else {
            search(keyword: "")
            return
        }
        search(keyword: keyword)
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        search(keyword: "")
    }
}

// MARK: - Extension: UITableViewDataSource
extension ContactsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: contactCell, for: indexPath)
        cell.textLabel?.text = contacts[indexPath.row]
        return cell
    }
}

// MARK: - Extension: UITableViewDelegate
extension ContactsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let contactDetailVC = ContactDetailViewController()
        contactDetailVC.contactDetail = contacts[indexPath.row]
        pushViewController(viewcontroller: contactDetailVC)
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case .insert:
            tableView.beginUpdates()
            tableView.insertRows(at: [IndexPath(row: indexPath.row + 1, section: indexPath.section)], with: .left)
            contacts.insert("💓💓💓💓", at: indexPath.row + 1)
            contactsData.insert("💓💓💓💓", at: indexPath.row + 1)
            tableView.endUpdates()
        case .delete:
            tableView.beginUpdates()
            tableView.deleteRows(at: [IndexPath(row: indexPath.row, section: indexPath.section)], with: .right)
            contacts.remove(at: indexPath.row)
            contactsData.remove(at: indexPath.row)
            tableView.endUpdates()
        case .none:
            return
        @unknown default:
            return
        }
    }

    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        let typeEdit = indexPath.row % 2
        switch typeEdit {
        case 0:
            return .insert
        default:
            return .delete
        }
    }
}
