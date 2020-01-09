//
//  OtherTableViewCell.swift
//  BaiTap04
//
//  Created by An Nguyễn on 1/4/20.
//  Copyright © 2020 An Nguyễn. All rights reserved.
//

import UIKit

class OtherTableViewCell: UITableViewCell {

    @IBOutlet weak var otherCollectionView: UICollectionView!

    override func awakeFromNib() {
        super.awakeFromNib()
        setupLayout()
    }

    private func setupLayout() {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 20
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: self.contentView.bounds.height, height: self.contentView.bounds.height)
        otherCollectionView.collectionViewLayout = layout
        otherCollectionView.dataSource = self
        let nib = UINib(nibName: "OtherCollectionViewCell", bundle: .main)
        otherCollectionView.register(nib, forCellWithReuseIdentifier: "otherCVCell")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

extension OtherTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "otherCVCell", for: indexPath) as! OtherCollectionViewCell
        cell.backgroundColor = .red
        return cell
    }
}
