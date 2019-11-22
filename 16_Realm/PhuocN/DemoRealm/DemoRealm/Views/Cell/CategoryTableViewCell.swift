//
//  CategoryTableViewCell.swift
//  DemoRealm
//
//  Created by PhuocNguyen on 11/4/19.
//  Copyright © 2019 PhuocNguyen. All rights reserved.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    
    func configUI(post: Post) {
        titleLabel.text = post.title
        dateLabel.text = post.createDate.description
        contentLabel.text = post.content
        if post.isFavorite {
            favoriteButton.setImage(#imageLiteral(resourceName: "ic-like"), for: .normal)
        } else {
            favoriteButton.setImage(#imageLiteral(resourceName: "ic-dislike"), for: .normal)
        }
    }
}
