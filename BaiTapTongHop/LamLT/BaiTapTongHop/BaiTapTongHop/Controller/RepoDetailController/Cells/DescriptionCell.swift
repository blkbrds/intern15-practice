//
//  DescriptionCell.swift
//  BaiTapTongHop
//
//  Created by PCI0002 on 6/11/20.
//  Copyright © 2020 LeThanhLam. All rights reserved.
//

import UIKit

final class DescriptionCell: UITableViewCell {
    
    //MARK: Properties
    @IBOutlet weak private var descriptionLabel: UILabel!

    var viewmodel: DescriptionCellViewModel? {
        didSet {
            updateView()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    //MARK: Private Function
    private func updateView() {
        descriptionLabel.text = viewmodel?.description
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
