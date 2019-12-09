//
//  HomeViewController.swift
//  Bai_Tap_14
//
//  Created by ANH NGUYỄN on 12/6/19.
//  Copyright © 2019 asiantech. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {

    var address: [Address] = Address.getDummyDatas()

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
        configCollectionView()
    }

    override func setUpNaVi() {
        title = "Home"
        let tableViewButton = UIBarButtonItem(image: UIImage(named: "tableViewMenu"), style: .plain, target: self, action: #selector(showTableView))
        navigationItem.rightBarButtonItem = tableViewButton
        tableViewButton.tintColor = .black
    }

    @objc func showTableView() {
        collectionView.isHidden = true
        tableView.isHidden = false
        let collectionViewButton = UIBarButtonItem(image: UIImage(named: "collectionMenu"), style: .plain, target: self, action: #selector(showCollectionView))
        navigationItem.rightBarButtonItem = collectionViewButton
        collectionViewButton.tintColor = .black
    }

    @objc func showCollectionView() {
        collectionView.isHidden = false
        tableView.isHidden = true
        let tableViewButton = UIBarButtonItem(image: UIImage(named: "tableViewMenu"), style: .plain, target: self, action: #selector(showTableView))
        navigationItem.rightBarButtonItem = tableViewButton
        tableViewButton.tintColor = .black
    }

    func configTableView() {
        //cell
        let nib = UINib(nibName: "HomeTableViewCell", bundle: Bundle.main)
        tableView.register(nib, forCellReuseIdentifier: "HomeTableViewCell")
        
        //header
        let nib2 = UINib(nibName: "SliderTableViewCell", bundle: .main)
        tableView.register(nib2, forCellReuseIdentifier: "SliderTableViewCell")
        
        //delegate & datasource
        tableView.delegate = self
        tableView.dataSource = self
    }

    func configCollectionView() {
        let nib = UINib(nibName: "HomeCollectionViewCell", bundle: Bundle.main)
        collectionView.register(nib, forCellWithReuseIdentifier: "HomeCollectionViewCell")
        collectionView.dataSource = self
    }
}
extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            //slides
            return 1
        } else if section == 1 {
            return address.count
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //section dau tien vs section thu 2 la 0 vs 1
        if indexPath.section == 0 {
            return 150
        } else if indexPath.section == 1 {
            return 100
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            //slides
            let cell = tableView.dequeueReusableCell(withIdentifier: "SliderTableViewCell", for: indexPath) as! SliderTableViewCell
            return cell
            
        } else if indexPath.section == 1 {
            //cells
            let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as! HomeTableViewCell
            cell.updateTabViewCell(avatar: address[indexPath.row].avatarImage, name: address[indexPath.row].nameImage, distance: address[indexPath.row].distance, value: address[indexPath.row].value, address: address[indexPath.row].address)
            return cell
        }
        
        return UITableViewCell()
    }
}
extension HomeViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        address.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionViewCell", for: indexPath) as! HomeCollectionViewCell
        cell.updateCollectionView(image: address[indexPath.row].avatarImage, name: address[indexPath.row].nameImage, address: address[indexPath.row].address, distrance: address[indexPath.row].distance, value: address[indexPath.row].value)
        return cell
    }
}


