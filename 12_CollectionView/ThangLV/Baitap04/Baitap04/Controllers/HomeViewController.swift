//
//  HomeViewController.swift
//  Baitap04
//
//  Created by PCI0008 on 1/15/20.
//  Copyright © 2020 PCI0008. All rights reserved.
//

import UIKit

final class HomeViewController: UIViewController {

    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private weak var tableView: UITableView!
    
    private let tableCellName: String = "CustomTableViewCell"
    private let collectionCellName: String = "CollectionCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
    }
    
    private func configTableView() {
        let cellNib = UINib(nibName: tableCellName, bundle: .main)
        tableView.register(cellNib, forCellReuseIdentifier: tableCellName)
        tableView.dataSource = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: collectionCellName)
        collectionView.dataSource = self
        collectionView.delegate = self
    }
}

extension HomeViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: tableCellName, for: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Section \(section)"
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: collectionCellName, for: indexPath)
        cell.backgroundColor = .purple
        return cell
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: collectionView.bounds.height)
    }
}
