//
//  ContactsViewController.swift
//  BaiTap2
//
//  Created by PCI0012 on 5/13/20.
//  Copyright © 2020 PCI0012. All rights reserved.
//

import UIKit

class ContactsViewController: UIViewController {
    
    @IBOutlet weak var contactsTableView: UITableView!
    @IBOutlet weak var nameTextField: UITextField!
    
    var contacts: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Contact"
        loadData()
        contactsTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        contactsTableView.dataSource = self
        configNavigationBar()
        // Do any additional setup after loading the view.
    }
    
    private func configNavigationBar() {
        let add = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonTouchUpInSide))
        navigationItem.rightBarButtonItem = add
    }
    
    @objc func addButtonTouchUpInSide() {
        guard let nameTextField = nameTextField.text else {
            return
        }
        contacts.insert(nameTextField, at: 0)
        contactsTableView.reloadData()
    }
    
    private func loadData() {
        guard let path = Bundle.main.url(forResource: "Contacts", withExtension: "plist") else {
            return
        }
        guard let contactsData = NSArray(contentsOf: path) as? [String] else {
            return
        }
        contacts = contactsData
    }
}

extension ContactsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = contactsTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = contacts[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            contacts.remove(at: indexPath.row)
            contactsTableView.beginUpdates()
            contactsTableView.deleteRows(at: [indexPath], with: .automatic)
            contactsTableView.endUpdates()
        }
    }
}
