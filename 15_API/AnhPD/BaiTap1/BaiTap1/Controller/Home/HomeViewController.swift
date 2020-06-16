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
        tableView.delegate = self
        tableView.dataSource = self
        loadAPI()
    }
    
//    private func configNavigation() {
//        let resetTabBarItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(loadAPI))
//        navigationItem.rightBarButtonItem = resetTabBarItem
//    }
    
    func loadAPI() {
        print("Load API")
        viewModel.loadAPI2 { (done, msg) in
            if done {
                print(msg)
                self.updateAPI()
            } else {
                print("API ERROR: \(msg)")
            }
        }
    }
        
    func updateAPI() {
        tableView.reloadData()
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.musics.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeCell", for: indexPath) as! HomeCell
        cell.viewModel = viewModel.viewModelCellForAtRow(indexPath: indexPath)
        return cell
    }
}

extension HomeViewController: UITableViewDelegate {
    
}
