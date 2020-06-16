//
//  HomeViewController.swift
//  BaiTap1API
//
//  Created by PCI0012 on 6/9/20.
//  Copyright © 2020 PCI0012. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let viewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
        // Do any additional setup after loading the view.
    }
    
    private func configTableView() {
        let nib = UINib(nibName: "HomeCell", bundle: .main)
        tableView.register(nib, forCellReuseIdentifier: "HomeCell")
        tableView.dataSource = self
        loadAPI()
    }
    
    private func loadAPI() {
        viewModel.loadAPI { (done, msg) in
            if done {
                self.tableView.reloadData()
            } else {
                print("Fail \(msg)")
            }
        }
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HomeCell", for: indexPath) as? HomeCell else {
            return UITableViewCell()
        }
        cell.setupUI()
        cell.delegate = self
        cell.indexPath = indexPath
        cell.viewModel = viewModel.viewModelCellForRowAt(indexPath: indexPath)
        return cell
    }
}

extension HomeViewController: HomeCellDelegate {
    func homeCell(cell: HomeCell, indexPath: IndexPath) {
        viewModel.dowloadImage(at: indexPath) { (indexPath, image) in
            if let image = image {
                self.tableView.reloadRows(at: [indexPath], with: .none)
            }
        }
    }
}

