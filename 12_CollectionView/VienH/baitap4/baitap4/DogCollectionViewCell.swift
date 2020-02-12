//
//  DogCollectionViewCell.swift
//  baitap4
//
//  Created by user on 2/11/20.
//  Copyright © 2020 VienH. All rights reserved.
//

import UIKit

class DogCollectionViewCell: UICollectionViewCell {
    
    typealias Status = DogViewController.Status

    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 10
        clipsToBounds = true
        avatarImageView.layer.cornerRadius = 65
        avatarImageView.clipsToBounds = true
    }
    
    func updateCell(avatar: UIImage, name: String) {
        avatarImageView.image = avatar
        nameLabel.text = name
        updateCell(status: Status)
    }
    
    func updateCell(status: Status) {
        switch status {
        case .standard:
            avatarImageView.layer.cornerRadius = 65
        default:
            avatarImageView.layer.cornerRadius = 30
        }
    }
}
