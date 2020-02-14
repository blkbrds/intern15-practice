//
//  DogCollectionViewCell.swift
//  baitap4
//
//  Created by user on 2/11/20.
//  Copyright © 2020 VienH. All rights reserved.
//

import UIKit

final class DogCollectionViewCell: UICollectionViewCell {
    
    typealias Status = DogViewController.Status

    @IBOutlet private weak var avatarImageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 10
        clipsToBounds = true
        avatarImageView.clipsToBounds = true
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
