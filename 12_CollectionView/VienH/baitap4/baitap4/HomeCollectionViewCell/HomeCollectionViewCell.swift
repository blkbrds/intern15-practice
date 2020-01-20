//
//  HomeCollectionViewCell.swift
//  baitap4
//
//  Created by user on 12/25/19.
//  Copyright © 2019 VienH. All rights reserved.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var avatarImageView: UIImageView!
    func configUI(avatarImage: UIImage?, cornerRadius: CGFloat = 0) {
            avatarImageView.image = avatarImage
            avatarImageView.layer.cornerRadius = cornerRadius
            avatarImageView.contentMode = .scaleAspectFill
    }
}
