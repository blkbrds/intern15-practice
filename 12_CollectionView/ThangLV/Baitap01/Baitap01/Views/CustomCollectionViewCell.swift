//
//  CustomCollectionViewCell.swift
//  Baitap01
//
//  Created by PCI0008 on 1/15/20.
//  Copyright © 2020 PCI0008. All rights reserved.
//

import UIKit

final class CustomCollectionViewCell: UICollectionViewCell {

    @IBOutlet private weak var numerialOrderLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configData(number: String) {
        numerialOrderLabel.text = number
        numerialOrderLabel.textColor = .white
    }
}
