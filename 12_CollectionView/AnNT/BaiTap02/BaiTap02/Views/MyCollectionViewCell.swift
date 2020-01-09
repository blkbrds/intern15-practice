//
//  MyCollectionViewCell.swift
//  BaiTap02
//
//  Created by An Nguyễn on 1/5/20.
//  Copyright © 2020 An Nguyễn. All rights reserved.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {

    @IBOutlet private weak var foodImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setupData(imageName: String) {
        if let image = UIImage(named: imageName) {
            foodImageView.image = image
        }
    }
}
