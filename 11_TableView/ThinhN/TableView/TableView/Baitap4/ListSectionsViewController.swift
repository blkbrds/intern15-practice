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
    var section: [SectionList] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "SECTIONS"
        loadData()
        configData()
    }
    func loadData() {
        guard let path = Bundle.main.url(forResource: "Section", withExtension: "plist") else { return }
        guard let contactData = NSArray(contentsOf: path) as? [String] else { return }
        section = contactData
       
    }
    func configData() {
        listSection.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        listSection.dataSource = self
    }
}
extension ListSectionsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        cell.textLabel?.text = "\(section[indexPath.row])"
        return cell
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Section0 "
        case 1:
            return "Section1"
        default:
            return "Section2"
        }
    }
}
