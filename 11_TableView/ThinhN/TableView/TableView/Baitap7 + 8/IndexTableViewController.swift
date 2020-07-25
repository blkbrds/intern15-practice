//
//  IndexTableViewController.swift
//  TableView
//
//  Created by PCI0019 on 6/30/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

class IndexTableViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var plistData: [String: [String]] = [:]
    var plistDataIndex: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        configTableView()
    }
    func loadData() {
        guard let path = Bundle.main.url(forResource: "SectionList", withExtension: "plist"),
            let contactData = NSDictionary(contentsOf: path) as? [String: [String]]
        else { return }
        plistData = contactData
        plistDataIndex = ["T", "G", "D"]
    }
    func configTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        tableView.dataSource = self
        tableView.delegate = self
    }
    
}
extension IndexTableViewController: UITableViewDataSource, UITableViewDelegate {
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return plistDataIndex
    }
    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        return index
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return plistData.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Array(plistData)[section].value.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        let label = UILabel(frame: CGRect(x: cell.bounds.midX, y: cell.bounds.midY , width: 80, height: 50))
        label.text = "Name + \(indexPath.row)"
        label.textColor = .red
        cell.textLabel?.text = (Array(plistData)[indexPath.section].value)[indexPath.row]
        if let labels = (cell.subviews.compactMap{ $0 as? UILabel }).first {
            labels.removeFromSuperview()
        }
        cell.addSubview(label)
        return cell
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return Array(plistData)[section].key
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
}
