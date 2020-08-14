//
//  MoveDetailViewController.swift
//  API_Bo_sung
//
//  Created by ADMIN on 8/14/2563 BE.
//  Copyright © 2563 BE asiantech. All rights reserved.
//

import UIKit

class MoveDetailViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var viewModel: MoveDetailViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
    }
    func configTableView() {
        let nib = UINib(nibName: "MoveDetailTableViewCell", bundle: .main)
        tableView.register(nib, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        loadAPI()
        tableView.rowHeight = 100
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
extension MoveDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.learnLevelName.count ?? 0
        //        guard let viewModel = viewModel else {return 0}
        //        switch viewModel.listInformation[section] {
        //        case .learnLevelName:
        //            return viewModel.learnLevelName.count
        //        case .learnMethodName:
        //            return viewModel.learnMethodName.count
        //        case .versionGroupName:
        //            return viewModel.versionGroupName.count
        //        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? MoveDetailTableViewCell else { return UITableViewCell()}
        guard let viewModel = viewModel else { return UITableViewCell() }
        cell.learnLevelLabel.text = ("Learn at level:\(viewModel.learnLevelName[indexPath.row])")
        cell.learnMethodLabel.text = "Learn method: \(viewModel.learnMethodName[indexPath.row])"
        cell.versionGroupLabel.text = "Version group: \(viewModel.versionGroupName[indexPath.row])"
        return cell
    }
}
