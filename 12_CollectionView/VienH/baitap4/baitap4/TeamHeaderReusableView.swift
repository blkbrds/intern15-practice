//
//  TeamHeaderReusableView.swift
//  baitap4
//
//  Created by user on 2/11/20.
//  Copyright © 2020 VienH. All rights reserved.
//

import UIKit

class TeamHeaderReusableView: UICollectionReusableView {
    
    typealias Status = DogViewController.Status

    @IBOutlet weak var teamAvatarImageView: UIImageView!
    @IBOutlet weak var teamNameLabel: UILabel!
    
    @IBOutlet weak var teamNameLabelLeadingContrain: NSLayoutConstraint!
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
            teamNameLabelLeadingContrain.constant = 10
            
        default:
            teamAvatarImageView.isHidden = true
            teamNameLabelLeadingContrain.constant = 10
        }
    }
    
}
