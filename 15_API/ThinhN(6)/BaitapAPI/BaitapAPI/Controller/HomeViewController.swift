//
//  HomeViewController.swift
//  BaitapAPI
//
//  Created by ADMIN on 8/11/2563 BE.
//  Copyright © 2563 BE asiantech. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var viewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
        loadAPI()
    }
    func configTableView() {
        let nib = UINib(nibName: "HomeTableViewCell", bundle: .main)
        tableView.register(nib, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        
    }
    
    private func updateUI() {
        tableView.reloadData()
    }
    func loadAPI() {
        viewModel.loadNameAPI { [weak self] (done, msg) in
            guard let self = self else { return}
            if done {
                self.updateUI()
            } else {
                print("API ERROR : \(msg)")
            }
        }
    }
}
extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? HomeTableViewCell else { return UITableViewCell() }
        let item = viewModel.books[indexPath.row]
        cell.bookNameLabel.text = item.name
        if item.image != nil {
            cell.bookImageView.image = item.image
        } else {
            cell.bookImageView.image = nil
        }
        Networking.shared().dowloadImage(url: item.urlImage) { (image) in
            if let image = image {
                cell.bookImageView.image = image
                item.image = image
            } else {
                cell.bookImageView.image = nil
            }
        }
        return cell 
    }
}
