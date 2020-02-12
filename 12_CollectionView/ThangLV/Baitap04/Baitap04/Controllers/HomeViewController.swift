//
//  HomeViewController.swift
//  Baitap04
//
//  Created by PCI0008 on 1/15/20.
//  Copyright © 2020 PCI0008. All rights reserved.
//

import UIKit

final class HomeViewController: UIViewController {
    
    struct Config {
        static let numberOfSectionsOfTableView: Int = 20
        static let numberOfRowsInSectionOfTableView: Int = 1
        static let numberOfItemsInSectionOfCollectionView = 10
    }
    
    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private weak var tableView: UITableView!
    
    private let customTableViewCell: String = "CustomTableViewCell"
    private let customCollectionViewCell: String = "CustomCollectionViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
    }
    
    private func configTableView() {
        let cellNib = UINib(nibName: customTableViewCell, bundle: .main)
        tableView.register(cellNib, forCellReuseIdentifier: customTableViewCell)
        tableView.dataSource = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: customCollectionViewCell)
        collectionView.dataSource = self
        collectionView.delegate = self
    }
}

extension HomeViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return Config.numberOfSectionsOfTableView
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Config.numberOfRowsInSectionOfTableView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: customTableViewCell, for: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Section \(section)"
    }
}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Config.numberOfItemsInSectionOfCollectionView
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: customCollectionViewCell, for: indexPath)
        cell.backgroundColor = .purple
        return cell
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: collectionView.bounds.height)
    }
}
