//
//  TeamHeaderCollectionReusableView.swift
//  baitap3+4
//
//  Created by user on 12/25/19.
//  Copyright © 2019 VienH. All rights reserved.
//

import UIKit

class TeamHeaderCollectionReusableView: UICollectionReusableView {

    
    @IBOutlet weak var teamName: UILabel!
    @IBOutlet weak var teamImage: UIImageView!
    
    override func awakeFromNib() {
            super.awakeFromNib()
            setupUI()
        }

        private func setupUI() {
            layer.backgroundColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
            teamName.clipsToBounds = true
        }

        func updateHeaderView(avatar: UIImage, name: String) {
            teamImage.image = avatar
            teamName.text = name
        }

        override func layoutSubviews() {
            super.layoutSubviews()
            teamImage.layer.cornerRadius = teamName.bounds.width / 2
        }
    }
