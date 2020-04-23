//
//  HomeViewController.swift
//  Bai1Vs2API
//
//  Created by PCI0002 on 4/23/20.
//  Copyright © 2020 LeThanhLam. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {

    // MARK: - IBOutlet
    @IBOutlet weak var tableview: UITableView!

    // MARK: - Properties
    private var viewModel = HomeViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        loadAPI()
//        setupUI()
        // Do any additional setup after loading the view.
    }

    override func setupUI() {
        let nib = UINib(nibName: "HomeTableViewCell", bundle: .main)
        tableview.register(nib, forCellReuseIdentifier: "cell")
        tableview.delegate = self
        tableview.dataSource = self
    }

    func updateUI() {
        tableview.reloadData()
    }

    func loadAPI() {
        print("LOAD API")
        viewModel.loadAPI { (done, msg) in
            if done {
                self.updateUI()
            } else {
                print("API ERROR: \(msg)")
            }
        }
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.musics.count
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HomeTableViewCell

        let item = viewModel.musics[indexPath.row]
        cell.titleLabel.text = item.title
        
        if item.thumbnailImage != nil {
            cell.cellImage.image = item.thumbnailImage
        } else {
            cell.cellImage.image = nil
            
            //downloader
            Networking.shared().downloadImage(url: item.imimage) { (image) in
                if let image = image {
                    cell.cellImage.image = image
                    item.thumbnailImage = image
                } else {
                    cell.cellImage.image = nil
                }
            }
        }
        
        return cell
    }
}
