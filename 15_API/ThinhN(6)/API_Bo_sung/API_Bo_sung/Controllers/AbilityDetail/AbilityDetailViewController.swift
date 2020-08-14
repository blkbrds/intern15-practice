//
//  AbilityDetailViewController.swift
//  API_Bo_sung
//
//  Created by ADMIN on 8/14/2563 BE.
//  Copyright © 2563 BE asiantech. All rights reserved.
//

import UIKit

class AbilityDetailViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var viewModel: AbilityDetailViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
        loadAPI()
    }
    
    func configTableView() {
        let nib = UINib(nibName: "AbilityDetailTableViewCell", bundle: .main)
        tableView.register(nib, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
    }
    
    func loadAPI() {
        viewModel?.loadAPI { (done, msg) in
            if done {
                self.updateUI()
            } else {
                print("API Error: \(msg)")
            }
        }
    }
    
    private func updateUI() {
        tableView.reloadData()
    }
}
extension AbilityDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.names.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? AbilityDetailTableViewCell else { return UITableViewCell() }
        cell.nameLabel.text = viewModel?.names[indexPath.row]
        return cell
    }
}
