//
//  DetailTableViewCell.swift
//  BaiTapTongHop
//
//  Created by PCI0018 on 11/29/19.
//  Copyright © 2019 Asian Tech. All rights reserved.
//

import UIKit

final class DetailTableViewCell: UITableViewCell {

    @IBOutlet private weak var avatarImageView: UIImageView!
    @IBOutlet private weak var usernamLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    
    var viewModel: DetailCellViewModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
