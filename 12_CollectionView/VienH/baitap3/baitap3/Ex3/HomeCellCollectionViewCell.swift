//
//  HomeCellCollectionViewCell.swift
//  baitap3+4
//
//  Created by user on 12/25/19.
//  Copyright © 2019 VienH. All rights reserved.
//

import UIKit

class HomeCellCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
            super.awakeFromNib()
            setupUI()
        }

        private func setupUI() {
            layer.backgroundColor = #colorLiteral(red: 0.7254902124, green: 0.4784313738, blue: 0.09803921729, alpha: 1)
            layer.cornerRadius = 10
            clipsToBounds = true
            avatarImageView.clipsToBounds = true
        }

        func updateCell(avatar: UIImage, name: String) {
            avatarImageView.image = avatar
            nameLabel.text = name
        }
    }
