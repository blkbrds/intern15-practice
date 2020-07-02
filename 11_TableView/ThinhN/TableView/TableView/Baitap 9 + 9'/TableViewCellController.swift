//
//  TableViewCellController.swift
//  TableView
//
//  Created by PCI0019 on 6/30/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

class TableViewCellController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var plistData: [String: [String]] = [:]
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Section"
        configTableView()
        loadData()
    }
    
    func loadData() {
        guard let path = Bundle.main.url(forResource: "SectionList", withExtension: "plist") else { return }
        guard let contactData = NSDictionary(contentsOf: path) as? [String: [String]] else { return }
        plistData = contactData
    }
    
    func configTableView() {
        let nib = UINib(nibName: "CustomTableViewCell", bundle: Bundle.main)
        tableView.register(nib, forCellReuseIdentifier: "CustomTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
    }
}
extension TableViewCellController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return plistData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Array(plistData)[section].value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as! CustomTableViewCell
        cell.contactNameLabel.text = (Array(plistData)[indexPath.section].value)[indexPath.row]
        cell.subtitleNameLabel.text = "Sub title"
        cell.contactNameLabel.textColor = .red
        cell.delegate = self
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
extension TableViewCellController: CustomTableViewCellDelegate {
    func tapButton(_customTabViewCell: CustomTableViewCell) {
        print("Tap me !!")
    }
}
