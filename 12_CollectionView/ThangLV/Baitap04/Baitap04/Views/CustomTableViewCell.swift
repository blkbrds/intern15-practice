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
       static let sizeForCell: CGSize = CGSize(width: 70, height: 70)
    }
    
    @IBOutlet private weak var collectionView: UICollectionView!
    
    private let cellName: String = "CustomCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configCollectionView()
    }
    
    private func configCollectionView() {
        let cellNib = UINib(nibName: cellName, bundle: .main)
        collectionView.register(cellNib, forCellWithReuseIdentifier: cellName)
        collectionView.dataSource = self
        collectionView.delegate = self
    }
}

extension CustomTableViewCell: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellName, for: indexPath)
        return cell
    }
}

extension CustomTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return Config.sizeForCell
    }
}
