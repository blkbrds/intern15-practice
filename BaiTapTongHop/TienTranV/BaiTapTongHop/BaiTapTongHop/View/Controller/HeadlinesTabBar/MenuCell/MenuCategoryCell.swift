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
    @IBOutlet private weak var backgroundColorView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColorView.clipsToBounds = true
        backgroundColorView.layer.cornerRadius = 2
        categoryLabel.autoresizingMask = [.flexibleWidth]
    }

    func configUI(category: String, isEnable: Bool) {
        categoryLabel.text = category
        backgroundColorView.backgroundColor = isEnable ? #colorLiteral(red: 0.4620226622, green: 0.8382837176, blue: 1, alpha: 1): #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    }

    func configUI(isEnable: Bool) {
        backgroundColorView.backgroundColor = isEnable ? #colorLiteral(red: 0.4620226622, green: 0.8382837176, blue: 1, alpha: 1): #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    }
}
