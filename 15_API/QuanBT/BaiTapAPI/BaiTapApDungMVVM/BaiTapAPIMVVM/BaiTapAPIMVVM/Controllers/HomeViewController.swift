//
//  HomeViewController.swift
//  BaiTapAPIMVVM
//
//  Created by Sếp Quân on 4/14/20.
//  Copyright © 2020 QuanBT. All rights reserved.
//

import UIKit

final class HomeViewController: UIViewController {
    // MARK: - IBOutlet
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Properties
    private var viewModel = HomeViewModel()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    // MARK: - Function
    private func setupView() {
        title = "Home"
        let nib = UINib(nibName: "HomeTableViewCell", bundle: .main)
        tableView.register(nib, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.rowHeight = 100
        loadAPI()
        let refreshButton = UIBarButtonItem(title: "Refresh Page", style: .done, target: self, action: #selector(refreshTouchUpInside))
        navigationItem.rightBarButtonItem = refreshButton
    }
    
    @objc private func refreshTouchUpInside() {
        tableView.alpha = 0
        UIView.animate(withDuration: 3, animations: {
            self.tableView.alpha = 1
        })
        loadAPI()
    }
    
    private func loadAPI() {
        print("Load API")
        viewModel.loadAPI {  (done, msg) in
            if done {
                self.tableView.reloadData()
            } else {
                print("API erorr: \(msg)")
            }
        }
        tableView.contentOffset = CGPoint(x: 0, y: 0)
    }
    
    private func loadMoreAPI(page: String) {
        print("Load API page ")
        tableView.alpha = 0
        UIView.animate(withDuration: 3, animations: {
            self.tableView.alpha = 1
        })
        viewModel.loadAPI(pageToken: page) {  (done, msg) in
            if done {
                self.tableView.reloadData()
            } else {
                print("API erorr: \(msg)")
            }
        }
        tableView.contentOffset = CGPoint(x: 0, y: 0)
    }
    
    // MARK: - IBAction

    @IBAction func prePageButtonTouchUpInside(_ sender: Any) {
        loadMoreAPI(page: viewModel.prevPageToken)
    }
    @IBAction func nextPageButtonTouchUpInside(_ sender: Any) {
        loadMoreAPI(page: viewModel.nextPageToken)
    }
}

// MARK: - UITableViewDataSource
extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRowInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HomeTableViewCell
        cell.viewModel = viewModel.viewModelForCell(at: indexPath)
        if let item = viewModel.dataAPIs[indexPath.row].url {
            Networking.shared().downloadImage(url: item) { (image) in
                if let image = image {
                    cell.configImage(image: image)
                } else {
                    cell.configImage(image: nil)
                }
            }
            
        }
        return cell
    }
}
