//
//  HomeViewController.swift
//  baitapMVVM
//
//  Created by user on 1/21/20.
//  Copyright © 2020 VienH. All rights reserved.
//

import UIKit

final class HomeViewController: BaseViewController {

    @IBOutlet weak var tableView: UITableView!

    var viewmodel = HomeViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - config
    override func setupUI() {
        super.setupUI()
        //title
        self.title = "Home"

        //tableview
        tableView.delegate = self
        tableView.dataSource = self
        let nib = UINib(nibName: "HomeCell", bundle: .main)
        tableView.register(nib, forCellReuseIdentifier: "cell")

        //navi
        let resetTabbarItem = UIBarButtonItem(title: "Refresh", style: .plain, target: self, action: #selector(loadAPI))
        self.navigationItem.rightBarButtonItem = resetTabbarItem
    }

    override func setupData() {
        print("LOAD API")
        viewmodel.loadAPI { (done, msg) in
            if done {
                self.updateUI()
            } else {
                print("API ERROR: \(msg)")
            }
        }
    }

    func updateUI() {
        tableView.reloadData()
    }

    @objc func loadAPI() {
    }
}

//MARK: - Tableview Delegate & Datasource
extension HomeViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewmodel.musics.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        200
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HomeCell
        let item = viewmodel.musics[indexPath.row]
        cell.titleLabel.text = item.name
        cell.artirstNameLabel.text = item.artistName
        if item.thumbnailImage != nil {
            cell.thumbnail.image = item.thumbnailImage
        } else {
            cell.thumbnail.image = nil
            Networking.shared().downloadImage(url: item.artworkUrl100) { (image) in
                if let image = image {
                    cell.thumbnail.image = image
                    item.thumbnailImage = image
                } else {
                    cell.thumbnail.image = nil
                }
            }
        }
        return cell
    }
}
