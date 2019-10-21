//
//  HomeViewController.swift
//  TableView
//
//  Created by PhuocNguyen on 10/18/19.
//  Copyright © 2019 PhuocNguyen. All rights reserved.
//

import UIKit

var groupContact: [Contact] = DataManagement.share.getContact(fileName: "contacts", type: "plist")

final class HomeViewController: UIViewController {
    
    //MARK: - Properties
    @IBOutlet private weak var searchBar: UISearchBar!
    @IBOutlet private weak var tableView: UITableView!
    
    private let groupUser = Dictionary(grouping: DataManagement.share.getUser(fileName: "users", type: "plist")) { (user) -> String in
        return String(user.first!)
    }
    private var contacts: [String: [Contact]] = [:]
    private var isSearchNumber = false
    private var isSearch: Bool = false
    private var searchData: [Contact] = []
    private var cellSelectedIndexPath: IndexPath?
    enum cellIdenfier: String {
        case defaultCell = "cellDefault"
        case contactsCell = "contactCell"
    }
    
    //MARK: - lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupNavi()
        fetchData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        isSearch = false
        fetchData()
        tableView.reloadData()
    }
    //MARK: - private func
    private func fetchData() {
        contacts = Dictionary(grouping: groupContact) { (contact) -> String in
            if contact.name.isEmpty {
                return "#"
            }
            return String(contact.name.first!.uppercased())
        }
    }
    
    private func setupUI() {
        searchBar.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdenfier.defaultCell.rawValue)
        tableView.register(UINib(nibName: "ContactTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: cellIdenfier.contactsCell.rawValue)
    }
    
    private func setupNavi() {
        title = "Contacts"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(pushToProfileVC))
    }
    
    private func editTableViewForSearch(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //searching phone number
        if searchData[indexPath.row].name.isEmpty {
            let cell = tableView.dequeueReusableCell(withIdentifier: cellIdenfier.defaultCell.rawValue, for: indexPath)
            cell.textLabel?.text = searchData[indexPath.row].phoneNumber
            return cell
        }
        //searching name
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdenfier.contactsCell.rawValue, for: indexPath) as! ContactTableViewCell
        cell.contact = searchData[indexPath.row]
        cell.backgroundColor = .white
        return cell
    }
    
    @objc private func pushToProfileVC() {
        let vc = ProfileViewController()
        vc.title = "Add Contact"
        vc.action = .add
        vc.delegate = self
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    //MARK: - DataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        if isSearch {
            return 1
        }
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if isSearch {
            return nil
        }
        return contacts.keys.sorted()[section]
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        if isSearch {
            return nil
        }
        return contacts.keys.sorted()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSearch {
            return searchData.count
        }
        return contacts[contacts.keys.sorted()[section]]!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // searching .....
        if isSearch {
            return editTableViewForSearch(tableView, cellForRowAt: indexPath)
        }
        // default table
        guard contacts.keys.sorted()[indexPath.section] != "#" else {
            let cell = tableView.dequeueReusableCell(withIdentifier: cellIdenfier.defaultCell.rawValue, for: indexPath)
            cell.textLabel?.text = contacts["#"]?[indexPath.row].phoneNumber
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdenfier.contactsCell.rawValue, for: indexPath) as! ContactTableViewCell
        cell.contact = contacts[contacts.keys.sorted()[indexPath.section]]?[indexPath.row]
        cell.backgroundColor = .white
        cell.delegate = self
        return cell
    }
    
    //MARK: - Delegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if contacts.keys.sorted()[indexPath.section] != "#" || isSearch && !searchData[indexPath.row].name.isEmpty {
            return 80
        }
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = ProfileViewController()
        if isSearch {
            vc.contact = searchData[indexPath.row]
        }
        vc.contact = contacts[contacts.keys.sorted()[indexPath.section]]?[indexPath.row]
        vc.title = "Edit Contact"
        vc.action = .edit
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            if let cell = tableView.cellForRow(at: indexPath)  as? ContactTableViewCell {
                for index in 0..<groupContact.count where groupContact[index].phoneNumber == cell.contact?.phoneNumber {
                    groupContact.remove(at: index)
                    break
                }
            } else {
                for index in 0..<groupContact.count where groupContact[index].phoneNumber == tableView.cellForRow(at: indexPath)?.textLabel?.text {
                    groupContact.remove(at: index)
                    break
                }
            }
            fetchData()
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
}

extension HomeViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            isSearch = false
        } else {
            // search phone number
            isSearch = true
            if Int(searchText) != nil {
                searchData = []
                contacts.forEach { (key, value) in
                    let phoneNumbers = value.filter { $0.phoneNumber.hasPrefix(searchText) }
                    searchData.append(contentsOf: phoneNumbers)
                }
            } else { // seaching name
                guard let contacts = contacts[(searchText.first!.uppercased())] else {
                    searchData = []
                    tableView.reloadData()
                    return
                }
                searchData = contacts.filter { $0.name.uppercased().hasPrefix(searchText.uppercased()) } 
            }
        }
        tableView.reloadData()
    }
}

extension HomeViewController: ContactTableViewCellDelegate {
    func doSomeThing(_ contactTablecell: ContactTableViewCell) {
        var contactName: String = ""
        if let name = contactTablecell.nameLabel.text {
            contactName = name
        }
        print("HomeVC --> tap \(contactName)")
    }
}

extension HomeViewController: ProfileViewControllerDelegate {
    func addContact(contact: Contact) {
        groupContact.append(contact)
        isSearch = false
        fetchData()
    }
}
