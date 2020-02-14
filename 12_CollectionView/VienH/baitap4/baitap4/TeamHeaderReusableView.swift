//
//  TeamHeaderReusableView.swift
//  baitap4
//
//  Created by user on 2/11/20.
//  Copyright © 2020 VienH. All rights reserved.
//

import UIKit

final class TeamHeaderReusableView: UICollectionReusableView {
    
    typealias Status = DogViewController.Status

    @IBOutlet private weak var teamAvatarImageView: UIImageView!
    @IBOutlet private weak var teamNameLabel: UILabel!
    @IBOutlet private weak var teamNameLabelLeadingContrain: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        teamAvatarImageView.layer.cornerRadius = 30
        teamAvatarImageView.clipsToBounds = true
    }
    
    func updateHeaderView(avatar: UIImage, name: String, status: Status) {
        teamAvatarImageView.image = avatar
        teamNameLabel.text = name
        updateHeaderViews(status: status)
    }
    
    func updateHeaderViews(status: Status) {
        switch status {
        case .standard:
            teamAvatarImageView.isHidden = false
            teamNameLabelLeadingContrain.constant = 80
            
        case .small:
            teamAvatarImageView.isHidden = true
            teamNameLabelLeadingContrain.constant = 10
        }
    }
}
