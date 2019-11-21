//
//  HeaderCollectionViewCell.swift
//  CollectionView
//
//  Created by PhuocNguyen on 10/21/19.
//  Copyright © 2019 PhuocNguyen. All rights reserved.
//

import UIKit

final class HeaderCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var teamNameLabel: UILabel!
    @IBOutlet private weak var teamAvatarImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        teamAvatarImageView.layer.cornerRadius = teamAvatarImageView.frame.width / 2
    }

    func updateHeaderView(status: Status) {
        switch status {
        case .small:
            teamAvatarImageView.isHidden = true
        case .standard:
            teamAvatarImageView.isHidden = false
        }
    }
    
    func update(avatar: UIImage, name: String, status: Status) {
        teamAvatarImageView.image = avatar
        teamNameLabel.text = name
        updateHeaderView(status: status)
    }
}
