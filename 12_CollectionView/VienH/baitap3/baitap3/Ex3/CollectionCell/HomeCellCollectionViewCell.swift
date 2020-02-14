//
//  HomeCellCollectionViewCell.swift
//  baitap3+4
//
//  Created by user on 12/25/19.
//  Copyright © 2019 VienH. All rights reserved.
//

import UIKit

final class HomeCellCollectionViewCell: UICollectionViewCell {

    @IBOutlet private weak var avatarImageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }

    private func setupUI() {}

    func updateCell(avatar: UIImage, name: String) {
        avatarImageView.image = avatar
        nameLabel.text = name
    }
}
