//
//  TeamHeaderReusableView.swift
//  CollectionViewAdvance
//
//  Created by PCI0018 on 11/18/19.
//  Copyright © 2019 Asian Tech. All rights reserved.
//

import UIKit

final class TeamHeaderReusableView: UICollectionReusableView {

    @IBOutlet private weak var teamNameLabel: UILabel!
    @IBOutlet private weak var teamImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }

    private func setupUI() {
        layer.backgroundColor = #colorLiteral(red: 0, green: 0.5628422499, blue: 0.3188166618, alpha: 1)
        teamImageView.clipsToBounds = true
    }

    func updateHeaderView(avatar: UIImage, name: String) {
        teamImageView.image = avatar
        teamNameLabel.text = name
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        teamImageView.layer.cornerRadius = teamImageView.bounds.width / 2
    }
}
