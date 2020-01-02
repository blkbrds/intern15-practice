//
//  NewsTableViewCell.swift
//  BaiTapTongHop
//
//  Created by PCI0002 on 12/30/19.
//  Copyright © 2019 TranVanTien. All rights reserved.
//

import UIKit

final class NewsTableViewCell: UITableViewCell {

    // MARK: - IBOutlet
    @IBOutlet weak var publishedLabel: UILabel!
    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var newsTitleLabel: UILabel!
    @IBOutlet weak var nameSourceLabel: UILabel!
    @IBOutlet weak var iconSourceImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configUI()
    }
    
    private func configUI() {
        newsImageView.clipsToBounds = true
        newsImageView.layer.cornerRadius = 7
        iconSourceImageView.layer.cornerRadius = 10
    }
}
