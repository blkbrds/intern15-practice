//
//  Ex02ViewController.swift
//  BaiTap11
//
//  Created by ANH NGUYỄN on 11/11/19.
//  Copyright © 2019 asiantech. All rights reserved.
//

import UIKit

final class Ex02ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    var exercise: Exercise?
    private var user: [User] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        loadData()

    }

    func setupUI() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.delegate = self
    }
    // lấy dữ liệu từ file plist
    func loadData() {
        user = DataManagement.share.getUser(fileName: "nameList", type: "plist")
    }
}
extension Ex02ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.user.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        let users = user[indexPath.row]
        cell?.textLabel?.text = users.name
        return cell!
    }
}

extension Ex02ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let contactDeTaiViewController = Ex03ViewController()
        contactDeTaiViewController.contact = user[indexPath.row].name
        navigationController?.pushViewController(contactDeTaiViewController, animated: true)
    }
}
// bai 3: cach van dung delegate didSelect
