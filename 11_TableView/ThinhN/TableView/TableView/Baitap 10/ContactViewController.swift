//
//  ContactViewController.swift
//  TableView
//
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit
import Contacts

class ContactViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    var plistData: [String: [String]] = [:]
    var result: [String] = []
    var names: [String] = []
    var isSearch: Bool = false
    var contactStore = CNContactStore()
    var contacts = [CNContact]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Contact"
        // loadData()
        configTableView()
        searchBar.delegate = self
        getContacts()
    }
    
    func configSearchBar() {
        searchBar.delegate = self
    }
    
    //    func loadData() {
    //        guard let path = Bundle.main.url(forResource: "ContactList", withExtension: "plist"), let contactData = NSDictionary(contentsOf: path) as? [String: [String]]  else { return }
    //        plistData = contactData
    //    }
    
    func configTableView() {
        let nib = UINib(nibName: "ContactTableViewCell", bundle: Bundle.main)
        tableView.register(nib, forCellReuseIdentifier: "ContactTableViewCell")
        tableView.dataSource = self
    }
    
    func getContacts() {
        let keys = [CNContactFormatter.descriptorForRequiredKeys(for: .fullName)]
        let request = CNContactFetchRequest(keysToFetch: keys)
        
        do {
            try self.contactStore.enumerateContacts(with: request) {
                (contact, stop) in
                // Array containing all unified contacts from everywhere
                self.contacts.append(contact)
            }
        }
        catch {
            print("unable to fetch contacts")
        }
        convertContactsToNames()
    }
    
    func convertContactsToNames() {
        for contact in contacts {
            names.append(contact.givenName + contact.familyName)
        }
    }
}
extension ContactViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        if isSearch {
            return 1
        } else {
            return names.count
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSearch {
            return result.count
        } else {
            //            return Array(plistData)[section].value.count
            return names.count
            
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactTableViewCell", for: indexPath) as! ContactTableViewCell
        if isSearch {
            cell.nameLabel.text = result[indexPath.row]
        } else {
            cell.nameLabel.text = names[indexPath.row]
        }
        return cell
    }
}
extension ContactViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        var searchResult: [String] = []
        if searchText == "" {
            isSearch = false
        } else {
            isSearch = true
            
        }
        for item in names {
            searchResult.append(item)
        }
        result = searchResult
        tableView.reloadData()
    }
}
