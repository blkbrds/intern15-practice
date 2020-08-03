//
//  HomeTableViewCell.swift
//  BaiTap5Realm
//
//  Created by Sếp Quân on 4/22/20.
//  Copyright © 2020 QuanBT. All rights reserved.
//

import UIKit

final class HomeTableViewCell: UITableViewCell {
    // MARK: - IBOutlet
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var countLabel: UILabel!
    @IBOutlet private weak var typeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: - Function
    func configUI(category: Category) {
        titleLabel.text = category.title
        countLabel.text = "\(category.posts.count)"
        typeLabel.text = category.type
        dateLabel.text = category.createDate.description
    }
}
