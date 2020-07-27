//
//  HomeViewController.swift
//  API
//
//  Created by PCI0019 on 7/24/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var viewModel = HomeViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func setupUI() {
        super.setupUI()
        self.title = "Home"
        
        let nib = UINib(nibName: "HomeTableViewCell", bundle: .main)
        tableView.register(nib, forCellReuseIdentifier: "tableView")
        tableView.dataSource = self
        tableView.delegate = self
        
        let resetTabbarView = UIBarButtonItem(image: UIImage(systemName: "circle"), style: .plain, target: self, action: #selector(loadAPI))
        self.navigationItem.rightBarButtonItem = resetTabbarView
    }
    
    private func updateView() {
        tableView.reloadData()
    }
    @objc func loadAPI() {
        print("load API")
        viewModel.loadAPI2 { (done, msg) in
            if done {
                self.updateView()
            } else {
                print("API Error: \(msg)")
            }
        }
    }
}
extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        200
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableView", for: indexPath) as! HomeTableViewCell
        
        let item = viewModel.musics[indexPath.row]
        cell.nameSongLabel.text = item.name
        cell.singerNameLabel.text = item.artistName
        
        if item.thumbnailImage != nil {
            cell.imageSongView.image = item.thumbnailImage
        } else {
            cell.imageSongView.image = nil
            
            //downloader
            Networking.shared().downloadImage(url: item.artworkUrl100) { (image) in
                if let image = image {
                    cell.imageSongView.image = image
                    item.thumbnailImage = image
                } else {
                    cell.imageSongView.image = nil
                }
            }
        }
        
        return cell
    }
}
