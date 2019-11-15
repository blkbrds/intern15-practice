//
//  HomeTableViewCell.swift
//  DemoRealm
//
//  Created by PhuocNguyen on 11/1/19.
//  Copyright © 2019 PhuocNguyen. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configUI(category: Category) {
        titleLabel.text = category.name
        countLabel.text = category.count > 1 ? "\(category.count) views" : "\(category.count) view"
        typeLabel.text = category.type
        dateLabel.text = category.date.description
    }
}
