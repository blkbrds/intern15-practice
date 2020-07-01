//
//  ContactViewController.swift
//  TableView
//
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

class ContactViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    var plistData: [String: [String]] = [:]
    var searchResult: [String: [String]] = [:]
    var names: [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Contact"
        configTableView()
        configData()
    }
    func search(keyword: String) {
        names = getContacts(keyword: keyword)
        tableView.reloadData()
    }
    func getContacts(keyword: String) -> [String] {
        if keyword.trimmingCharacters(in: CharacterSet(charactersIn: "")) == "" {
            return Array(plistData.keys)
        } else {
            var data: [String] = []
            for name in Array(plistData.keys) {
                if let _ = name.range(of: keyword) {
                    data.append(name)
                }
            }
            return data
        }
    }
    func configData() {
        guard let path = Bundle.main.url(forResource: "ContactList", withExtension: "plist"),
            let contactData = NSDictionary(contentsOf: path) as? [String: [String]]
            else { return }
        plistData = contactData
    }
    func configTableView() {
        let nib = UINib(nibName: "ContactTabelViewCell", bundle: Bundle.main)
        tableView.register(nib, forCellReuseIdentifier: "ContactTabelViewCell")
        tableView.delegate = self
        tableView.dataSource = self
    }
}
extension ContactViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return plistData.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Array(plistData)[section].value.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactTableViewCell", for: indexPath) as! ContactTableViewCell
        cell.nameLabel.text = (Array(plistData)[indexPath.section].value)[indexPath.row]
        cell.phoneNumberLabel.text = "Sub title"
        cell.nameLabel.textColor = .red
        //        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return Array(plistData)[section].key
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let contactDetailViewController = ContactDetailViewController()
        contactDetailViewController.name = (Array(plistData)[indexPath.section].value)[indexPath.row]
        navigationController?.pushViewController(contactDetailViewController, animated: true)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
//extension ContactViewController: ContactTableViewCell {
//    func tapButton(_customTabViewCell: ContactTableViewCell) {
//        print("Tap me !!")
//    }
//}
