//
//  CollectionViewCell.swift
//  BaiTapAutoLayout
//
//  Created by PCI0018 on 10/24/19.
//  Copyright © 2019 Tien Le P. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var desciptionLabel: UILabel!
    @IBOutlet weak var maskCellView: UIView!
    @IBOutlet weak var backGroundImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
