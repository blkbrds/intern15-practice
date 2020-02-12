//
//  CustomCell.swift
//  BaitapHandleAPI
//
//  Created by PCI0008 on 2/11/20.
//  Copyright © 2020 PCI0008. All rights reserved.
//

import UIKit

final class CustomCell: UITableViewCell {
    
    //MARK: - IBOutlets
    @IBOutlet private weak var songImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var artistNameLabel: UILabel!
    
    func configData(title: String, artistName: String) {
        titleLabel.text = title
        artistNameLabel.text = artistName
    }
    
    func configData2(thumbnailImage: UIImage?) {
        songImageView.image = thumbnailImage
    }
}
