//
//  Ex1ViewController.swift
//  PracticeTemplate
//
//  Created by Tien Le P. on 6/22/18.
//  Copyright © 2018 Tien Le P. All rights reserved.
//

import UIKit

class Ex1ViewController: BaseViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var exercise: Exercise?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    func setUpUI() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellView")
        tableView.dataSource = self
    }
    
}
extension Ex1ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 010
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellView", for: indexPath)
        cell.textLabel?.text = "Name \(indexPath.row)"
        return cell
    }
}
