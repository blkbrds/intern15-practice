//
//  HomeTableViewCell.swift
//  BaiTap4
//
//  Created by PCI0012 on 5/28/20.
//  Copyright © 2020 PCI0012. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var numberLabel: UILabel!
    
    var numbers: [Int] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configCollectionView() {
        let nib = UINib(nibName: "HomeCollectionViewCell", bundle: .main)
        collectionView.register(nib, forCellWithReuseIdentifier: "HomeCollectionViewCell")
        
        let header = UINib(nibName: "HomeHeaderView", bundle: .main)
        collectionView.register(header, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HomeHeaderView")
        
        collectionView.dataSource = self
    }
    
    func updateNumbers() {
        for index in 1...10 {
            numbers.append(index)
        }
    }
}

extension HomeTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numbers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionViewCell", for: indexPath) as? HomeCollectionViewCell ?? HomeCollectionViewCell()
        cell.numberLabel.text = String(numbers[indexPath.row])
        return cell
    }
}


