//
//  HomeCollectionViewCell.swift
//  CollectionView4
//
//  Created by PhuocNguyen on 10/22/19.
//  Copyright © 2019 PhuocNguyen. All rights reserved.
//

import UIKit

final class HomeCollectionViewCell: UICollectionViewCell {

    @IBOutlet private weak var avatarImageView: UIImageView!
    
    func configUI(avatarImage: UIImage?, cornerRadius: CGFloat = 0) {
        avatarImageView.image = avatarImage
        avatarImageView.layer.cornerRadius = cornerRadius
        avatarImageView.contentMode = .scaleAspectFill
    }
}
