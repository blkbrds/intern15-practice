//
//  HomeViewController.swift
//  BaiTap1
//
//  Created by PCI0012 on 6/4/20.
//  Copyright © 2020 PCI0012. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel = HomeViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
    }
    
    private func configTableView() {
        let nib = UINib(nibName: "HomeCell", bundle: .main)
        tableView.register(nib, forCellReuseIdentifier: "HomeCell")
        tableView.dataSource = self
        loadAPI()
    }
    
    private func loadAPI() {
        print("Load API")
        viewModel.loadAPI2 { (done, msg) in
            if done {
                print("aaaaaa")
                self.updateUI()
            } else {
                let alert = UIAlertController(title: "Waring", message: msg, preferredStyle: .alert)
                let okAction = UIAlertAction(title: "OK", style: .default) { (UIAlertAction) in
                    return
                }
                alert.addAction(okAction)
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    private func updateUI() {
        self.tableView.reloadData()
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
        cell.viewModel = viewModel.viewModelCellForAtRow(indexPath: indexPath)
        return cell
    }
}
