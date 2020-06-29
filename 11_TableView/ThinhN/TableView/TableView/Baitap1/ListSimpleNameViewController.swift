//
//  ListSimpleNameViewController.swift
//  TableView
//
//  Created by PCI0019 on 6/29/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

class ListSimpleNameViewController: UIViewController {
    
    @IBOutlet weak var listSimpleName: UITableView!
    
    var names: [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        configName()
    }
    func configName() {
        listSimpleName.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        listSimpleName.dataSource = self
    }
}
extension ListSimpleNameViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        cell.textLabel?.text = " Name\(indexPath.row + 1)"
        return cell
    }
}
