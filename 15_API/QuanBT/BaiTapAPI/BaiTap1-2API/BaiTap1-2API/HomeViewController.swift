//
//  HomeViewController.swift
//  BaiTap1-2API
//
//  Created by Sếp Quân on 4/12/20.
//  Copyright © 2020 QuanBT. All rights reserved.
//

import UIKit

final class HomeViewController: UIViewController {
    // MARK: - IBOutlet
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Properties
    private var viewModel = HomeViewModel()
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        let nib = UINib(nibName: "TableViewCell", bundle: .main)
        tableView.register(nib, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        loadAPI()
        loadAPIImage()
        tableView.rowHeight = 100
    }
    
    // MARK: - Function
    private func loadAPI() {
        print("Load API")
        viewModel.loadAPI { [weak self] (done, msg) in
            guard let this = self else { return }
            if done {
                this.updateUI()
            } else {
                print("API erorr: \(msg)")
            }
        }
    }
    
    private func loadAPIImage() {
        print("Load APIImage")
        viewModel.loadAPIImage { [weak self] (done, msg) in
            guard let this = self else { return }
            if done {
                this.updateUI()
            } else {
                print("API erorr: \(msg)")
            }
        }
    }
    
    private func updateUI() {
        tableView.reloadData()
    }
}

// MARK: - UITableViewDataSource
extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.cellLabel.text = viewModel.names[indexPath.row]
        let item = viewModel.urlImages[indexPath.row]
        viewModel.loadImage(at: indexPath) { [weak self] (done, error, url) in
            guard let _ = self else { return }
            if done, url == item {
                cell.cellImageView.image = self!.viewModel.images
            }
        }
        return cell
    }
}
