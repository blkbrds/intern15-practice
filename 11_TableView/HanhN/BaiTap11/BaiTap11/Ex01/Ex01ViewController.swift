//
//  Ex01ViewController.swift
//  BaiTap11
//
//  Created by ANH NGUYỄN on 11/11/19.
//  Copyright © 2019 asiantech. All rights reserved.
//

import UIKit

class Ex01ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        seupUI()
    }
    
    func seupUI() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellView")
        tableView.dataSource = self
    }
    
}
extension Ex01ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellView", for: indexPath)
        cell.textLabel?.text = "Name \(indexPath.row)"
        return cell
    }
}
