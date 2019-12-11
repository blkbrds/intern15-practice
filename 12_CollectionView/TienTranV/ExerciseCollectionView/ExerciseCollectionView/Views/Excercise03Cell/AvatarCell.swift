//
//  AvatarCell.swift
//  ExerciseCollectionView
//
//  Created by PCI0002 on 12/10/19.
//  Copyright © 2019 TranVanTien. All rights reserved.
//

import UIKit

final class AvatarCell: UICollectionViewCell {

    // MARK: - IBOutlets
    @IBOutlet private weak var avatarImageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    
    // MARK: - Properties
    typealias GetAvatar = () -> Avatar
    
    // MARK: - Public funcs
    func configUI(avatar: GetAvatar) {
        let avatar = avatar()
        avatarImageView.image = UIImage(named: avatar.nameImage)
        nameLabel.text = avatar.name
    }
}
