//
//  ManginalViewController.swift
//  BaiTap11
//
//  Created by ANH NGUYỄN on 11/27/19.
//  Copyright © 2019 asiantech. All rights reserved.
//

import UIKit

final class ManginalViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    var account: [Account] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
        setUpUI()

    }

    func configTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.delegate = self

        let nib = UINib(nibName: "ManginalTableViewCell", bundle: Bundle.main)
        tableView.register(nib, forCellReuseIdentifier: "ManginalTableViewCell")
        tableView.dataSource = self
        tableView.delegate = self
    }

    func setUpUI() {
        account = ManrginalDataManagement.share.getExercises(fileName: "advancedList", type: "plist")
    }
}
extension ManginalViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return account.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "ManginalTableViewCell", for: indexPath) as! ManginalTableViewCell
        let vc = account[indexPath.row]
        cell.updateTabelCell(avatar: vc.image, name: vc.name, subtile: vc.subtile)
        cell.delegate = self
        cell.index = indexPath.row
        cell.name = vc.name
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}

extension ManginalViewController: ManginalTableViewCellDelegate {
    func sendIndex(view: ManginalTableViewCell, needsPerform action: ManginalTableViewCell.Action, index: Int, name: String) {
            print("\(name) \(index)")
    }
}

