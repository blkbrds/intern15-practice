//
//  TeamHeaderCollectionReusableView.swift
//  baitap3+4
//
//  Created by user on 12/25/19.
//  Copyright © 2019 VienH. All rights reserved.
//

import UIKit

class TeamHeaderCollectionReusableView: UICollectionReusableView {

    @IBOutlet private weak var teamNameLabel: UILabel!
    @IBOutlet private weak var teamImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }

    private func setupUI() {
        layer.backgroundColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        teamNameLabel.clipsToBounds = true
        teamImageView.layer.cornerRadius = 30
    }

    func updateHeaderView(avatar: UIImage, name: String) {
        teamImageView.image = avatar
        teamNameLabel.text = name
    }
}
