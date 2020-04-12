//
//  TableViewCell.swift
//  BaiTap1-2API
//
//  Created by Sếp Quân on 4/12/20.
//  Copyright © 2020 QuanBT. All rights reserved.
//

import UIKit

final class TableViewCell: UITableViewCell {
    // MARK: - IBOutlet
    @IBOutlet weak var cellImageView: UIImageView!
    @IBOutlet weak var cellLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: - Override
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
