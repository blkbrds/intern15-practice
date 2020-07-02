//
//  ListNamesViewController.swift
//  TableView
//
//  Created by PCI0019 on 6/29/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

class ListNamesViewController: UIViewController {

    var names: [String] = []
    @IBOutlet weak var listNamesView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        configTableView()
    }
    
    func loadData() {
        guard let path = Bundle.main.url(forResource: "ListNames", withExtension: "plist") else { return }
        guard let contactData = NSArray(contentsOf: path) as? [String] else { return }
        names = contactData
    }
    
    func configTableView() {
        listNamesView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        listNamesView.dataSource = self
    }
}
extension ListNamesViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        cell.textLabel?.text = "\(names[indexPath.row])"
        return cell
    }
}
