//
//  FavoritesViewController.swift
//  BaiTapAPIMVVM
//
//  Created by Sếp Quân on 4/24/20.
//  Copyright © 2020 QuanBT. All rights reserved.
//

import UIKit

class FavoritesViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private var viewModel = FavoritesViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
         setupView()
    }

    // MARK: - Function
       private func setupView() {
           title = "Favorites"
           let nib = UINib(nibName: "HomeTableViewCell", bundle: .main)
           tableView.register(nib, forCellReuseIdentifier: "cell")
           tableView.dataSource = self
           tableView.rowHeight = 100
        let deleteButton = UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: #selector(deleteButtonTouchUpInside))
           navigationItem.rightBarButtonItem = deleteButton
       }
    
    @objc private func deleteButtonTouchUpInside() {
    }
    
}

// MARK: - UITableViewDataSource
extension FavoritesViewController: UITableViewDataSource {
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
