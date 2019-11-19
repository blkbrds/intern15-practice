//
//  HeroCollectionViewCell.swift
//  CollectionViewAdvance
//
//  Created by PCI0018 on 11/18/19.
//  Copyright © 2019 Asian Tech. All rights reserved.
//

import UIKit

final class HeroCollectionViewCell: UICollectionViewCell {

    @IBOutlet private weak var avatarImageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }

    private func setupUI() {
        layer.backgroundColor = #colorLiteral(red: 0, green: 0.5690457821, blue: 0.5746168494, alpha: 1)
        layer.cornerRadius = 10
        clipsToBounds = true
        avatarImageView.clipsToBounds = true
    }

    func updateCell(avatar: UIImage, name: String) {
        avatarImageView.image = avatar
        nameLabel.text = name
    }
}
