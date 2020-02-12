//
//  CustomTableViewCell.swift
//  Baitap04
//
//  Created by PCI0008 on 1/16/20.
//  Copyright © 2020 PCI0008. All rights reserved.
//

import UIKit

final class CustomTableViewCell: UITableViewCell {
    
    struct Config {
       static let sizeForItem: CGSize = CGSize(width: 70, height: 70)
       static let numberOfItems: Int = 20
    }
    
    @IBOutlet private weak var collectionView: UICollectionView!
    
    private let customCollectionViewCell: String = "CustomCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configCollectionView()
    }
    
    private func configCollectionView() {
        let cellNib = UINib(nibName: customCollectionViewCell, bundle: .main)
        collectionView.register(cellNib, forCellWithReuseIdentifier: customCollectionViewCell)
        collectionView.dataSource = self
        collectionView.delegate = self
    }
}

extension CustomTableViewCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Config.numberOfItems
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: customCollectionViewCell, for: indexPath)
        return cell
    }
}

extension CustomTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return Config.sizeForItem
    }
}
