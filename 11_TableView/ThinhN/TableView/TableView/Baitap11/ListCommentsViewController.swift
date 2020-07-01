//
//  ListCommentsViewController.swift
//  TableView
//
//  Created by PCI0019 on 7/1/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

class ListCommentsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var value: [String] = ["afdfa", "fasdfasf", "adsfasf"]
    var textComment: [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
        loadData()
    }
    func configTableView() {
        let nib = UINib(nibName: "CommentTableViewCell", bundle: Bundle.main)
        tableView.register(nib, forCellReuseIdentifier: "CommentTableViewCell")
        tableView.dataSource = self
    }
    func loadData() {
        guard let path = Bundle.main.url(forResource: "ListComment", withExtension: "plist") else { return }
        guard let contactData = NSArray(contentsOf: path) as? [String] else { return }
        textComment = contactData
    }
}
extension ListCommentsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return textComment.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CommentTableViewCell", for: indexPath) as! CommentTableViewCell
        cell.nameLabel.text = textComment[indexPath.row]
        return cell
    }
}
