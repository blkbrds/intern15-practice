//
//  TeamHeaderCollectionReusableView.swift
//  baitap3+4
//
//  Created by user on 12/25/19.
//  Copyright © 2019 VienH. All rights reserved.
//

import UIKit

final class TeamHeaderCollectionReusableView: UICollectionReusableView {

    struct Config {
        static let teamImageViewCornerRadius: CGFloat = 40
    }

    @IBOutlet private weak var teamNameLabel: UILabel!
    @IBOutlet private weak var teamImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }

    private func setupUI() {
        layer.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        teamImageView.layer.cornerRadius = Config.teamImageViewCornerRadius
    }

    func updateHeaderView(avatar: UIImage, name: String) {
        teamImageView.image = avatar
        teamNameLabel.text = name
    }
}
