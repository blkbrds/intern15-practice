//
//  DetailListNamesViewController.swift
//  TableView
//
//  Created by PCI0019 on 6/29/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

class DetailListNamesViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var names: [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        configTableView()
        loadData()
    }
    func loadData() {
        guard let path = Bundle.main.url(forResource: "ListNames", withExtension: "plist"), let contactData = NSArray(contentsOf: path) as? [String]  else { return }
        names = contactData
    }
    func configTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        tableView.dataSource = self
        tableView.delegate = self
    }
}
extension DetailListNamesViewController: UITableViewDataSource {
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
extension DetailListNamesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailNameViewController = DetailNameViewController()
        detailNameViewController.contactName = names[indexPath.row]
        navigationController?.pushViewController(detailNameViewController, animated: true)
    }
}
