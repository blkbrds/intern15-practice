//
//  HomeCollectionViewCell.swift
//  CollectionView
//
//  Created by PhuocNguyen on 10/21/19.
//  Copyright © 2019 PhuocNguyen. All rights reserved.
//

import UIKit

final class HomeCollectionViewCell: UICollectionViewCell {

    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var avatarImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 10
        clipsToBounds = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        avatarImageView.layer.cornerRadius = (frame.width - 20) / 2
    }
    
    func updateCell(status: Status, avatar: UIImage, name: String) {
        avatarImageView.image = avatar
        nameLabel.text = name
        updateCell(status: status)
    }
    
    func updateCell(status: Status) {
        switch status {
        case .small:
            avatarImageView.layer.cornerRadius = 30
        case .standard:
            avatarImageView.layer.cornerRadius = 65
        }
    }
}
