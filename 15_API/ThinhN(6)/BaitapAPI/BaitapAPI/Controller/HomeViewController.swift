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
                self.showAlert(msg: msg)
            }
        }
    }
    
    func showAlert(msg: String) {
        let alert = UIAlertController(title: "Warning", message: msg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: nil))
        self.present(alert,animated: true, completion: nil )
    }
}
extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? HomeTableViewCell else { return UITableViewCell() }
        cell.viewModel = viewModel.viewModelForCell(at: indexPath)
        let item = viewModel.books[indexPath.row]
        viewModel.loadImage(urlString: item.urlImage) { (image) in
            if let image = image {
                cell.configImage(image: image)
            } else {
                cell.configImage(image: nil)
            }
        }
        return cell 
    }
}
