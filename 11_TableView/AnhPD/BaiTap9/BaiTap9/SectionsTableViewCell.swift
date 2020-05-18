//
//  SectionsTableViewCell.swift
//  BaiTap9
//
//  Created by PCI0012 on 5/15/20.
//  Copyright © 2020 PCI0012. All rights reserved.
//

import UIKit

class SectionsTableViewCell: UITableViewCell {

    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    
    var homeBundleData: HomeBundleData? {
        didSet {
            updateView()
        }
    }
    
    private func updateView() {
        guard let data = homeBundleData else { return }
        nameLabel.text = data.name
        subTitleLabel.text = data.subTitle
        avatarImageView.image = UIImage(named: data.avatar)
    }
    
}
