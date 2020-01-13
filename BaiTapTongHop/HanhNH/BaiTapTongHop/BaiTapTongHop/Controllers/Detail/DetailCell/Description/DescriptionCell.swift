//
//  CommentTableViewCell.swift
//  BaiTapTongHop
//
//  Created by ANH NGUYỄN on 1/6/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

final class DescriptionCell: UITableViewCell {
    
    @IBOutlet private weak var descriptionLabel: UILabel!
    
    var viewModel: DescriptionViewModel? {
        didSet {
            updateDescription()
        }
    }
    
    private func updateDescription() {
        descriptionLabel.text = viewModel?.description
    }
}
