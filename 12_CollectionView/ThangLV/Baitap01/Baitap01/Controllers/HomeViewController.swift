//
//  HomeViewController.swift
//  Baitap01
//
//  Created by PCI0008 on 1/15/20.
//  Copyright © 2020 PCI0008. All rights reserved.
//

import UIKit

final class HomeViewController: UIViewController {
    
    struct Identifier {
        static let customCollectionViewCell: String = "CustomCollectionViewCell"
    }
    
    struct Config {
        static let numberOfCollectionViewCell: Int = 100
    }
    
    @IBOutlet private weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configCollectionView()
        collectionView.dataSource = self
    }
    
    private func configCollectionView() {
        let cellNib = UINib(nibName: Identifier.customCollectionViewCell, bundle: .main)
        collectionView.register(cellNib, forCellWithReuseIdentifier: Identifier.customCollectionViewCell)
    }
}

extension HomeViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Config.numberOfCollectionViewCell
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Identifier.customCollectionViewCell, for: indexPath) as! CustomCollectionViewCell
        let number: Int = indexPath.row
        let strNumber: String = String(number)
        cell.configData(number: strNumber)
        return cell
    }
}


