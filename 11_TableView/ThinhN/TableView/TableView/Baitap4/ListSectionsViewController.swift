//
//  ListSectionsViewController.swift
//  TableView
//
//  Created by PCI0019 on 6/29/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

class ListSectionsViewController: UIViewController {
    
    @IBOutlet weak var listSection: UITableView!
    var plistData: [String: [String]] = [:]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "SECTIONS"
        configData()
        loadData()
    }
    func loadData() {
        guard let path = Bundle.main.url(forResource: "SectionList", withExtension: "plist"), let contactData = NSDictionary(contentsOf: path) as? [String: [String]] else { return }
        plistData = contactData
    }
    func configData() {
        listSection.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        listSection.dataSource = self
    }
}
extension ListSectionsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return plistData.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(Array(plistData.keys))
        return Array(plistData)[section].value.count
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        cell.textLabel?.text = (Array(plistData)[indexPath.section].value)[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        //        return Array(plistData)[section].key
        switch section {
        case 0:
            return "Ga cam "
        case 1:
            return "Do dung"
        default:
            return "Mon an "
        }
    }
}
