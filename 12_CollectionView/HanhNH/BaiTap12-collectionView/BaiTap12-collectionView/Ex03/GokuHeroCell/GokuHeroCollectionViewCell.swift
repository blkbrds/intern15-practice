//
//  GokuHeroCollectionViewCell.swift
//  BaiTap12-collectionView
//
//  Created by ANH NGUYỄN on 11/30/19.
//  Copyright © 2019 asiantech. All rights reserved.
//

import UIKit

class GokuHeroCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 10
        clipsToBounds = true
    }

    func updateCell(avatar: UIImage, name: String, status: Status) {
        avatarImageView.image = avatar
        nameLabel.text = name
        updateCell(status: status)
    }

    func updateCell(status: Status) {
        switch status {
        case .standard:
            avatarImageView.layer.cornerRadius = 65
        case .small:
            avatarImageView.layer.cornerRadius = 30
        }
    }
}
