//
//  MenuCategoryCell.swift
//  BaiTapTongHop
//
//  Created by PCI0002 on 12/31/19.
//  Copyright © 2019 TranVanTien. All rights reserved.
//

import UIKit

final class MenuCategoryCell: UICollectionViewCell {

    @IBOutlet private weak var categoryLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
      
    }
    
    func configUI(category: String) {
        categoryLabel.text = category
    }
}
