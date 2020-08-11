//
//  HomeViewController.swift
//  Baitap2API
//
//  Created by ADMIN on 7/29/2563 BE.
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
        tableView.register(nib, forCellReuseIdentifier: "tableView")
        tableView.dataSource = self
        loadAPIImage()
        tableView.rowHeight = 100
    }
    
    func loadAPI() {
        print("load API")
        viewModel.loadNameAPI { (done, msg) in
            if done {
                self.updateUI()
            } else {
                print("API Error: \(msg)")
            }
        }
    }
    
    private func loadAPIImage() {
        print("Load APIImage")
        
        viewModel.loadImageAPI { (done, msg) in
            if done {
                self.updateUI()
            } else {
                print("API erorr: \(msg)")
            }
        }
    }
    
    private func updateUI() {
        tableView.reloadData()
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.nameBooks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "tableView", for: indexPath) as? HomeTableViewCell else {return UITableViewCell()}
        cell.bookNameLabel.text = viewModel.nameBooks[indexPath.row]
        if viewModel.urlBooks.count != 0 {
            let item = viewModel.urlBooks[indexPath.row]
            viewModel.loadImage(at: indexPath) { (done, error, url) in
                if done, url == item {
                    cell.bookImageView.image = self.viewModel.images
                }
            }
        }
        return cell
    }
}
