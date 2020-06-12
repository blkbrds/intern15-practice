//
//  HomeViewController.swift
//  BaiTap3
//
//  Created by PCI0012 on 5/13/20.
//  Copyright © 2020 PCI0012. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var contactsTableView: UITableView!
    
    var contacts: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        loadData()
        contactsTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        contactsTableView.dataSource = self
        contactsTableView.delegate = self
        // Do any additional setup after loading the view.
    }
    
    func loadData() {
        guard let path = Bundle.main.url(forResource: "Contacts", withExtension: "plist") else {
            return
        }
        guard let contactsData = NSArray(contentsOf: path) as? [String] else {
            return
        }
        contacts = contactsData
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = contactsTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = contacts[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewController()
        vc.userName = contacts[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
}
