//
//  TeamHeaderCollectionReusableView.swift
//  BaiTap12-collectionView
//
//  Created by ANH NGUYỄN on 11/30/19.
//  Copyright © 2019 asiantech. All rights reserved.
//

import UIKit
class TeamHeaderCollectionReusableView: UICollectionReusableView {

    var status: Status = .standard

    @IBOutlet weak var teamNameLabel: UILabel!
    @IBOutlet weak var teamAvatarImageView: UIImageView!
    @IBOutlet weak var teamNameLabelLeadingConstraint: NSLayoutConstraint!

    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 10
        clipsToBounds = true
    }

    func updateHeaderView(avatar: UIImage, name: String, status: Status) {
        teamAvatarImageView.image = avatar
        teamNameLabel.text = name
        updateHeader(status: status)
    }

    func updateHeader(status: Status) {
        switch status {
        case .standard:
            teamAvatarImageView.isHidden = false
            teamNameLabelLeadingConstraint.constant = 65
        case .small:
            teamAvatarImageView.isHidden = true
            teamNameLabelLeadingConstraint.constant = 30
        }
    }
}
