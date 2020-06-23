//
//  HomeCell.swift
//  BaiTapRealm
//
//  Created by PCI0012 on 6/22/20.
//  Copyright © 2020 PCI0012. All rights reserved.
//

import UIKit

class HomeCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    
    var viewModel: HomeCellViewModel? {
        didSet {
            updateView()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func updateView() {
        guard let viewModel = viewModel else {
            return
        }
        titleLabel.text = viewModel.title
        subTitleLabel.text = viewModel.subTitle
        idLabel.text = String(viewModel.id)
    }
    
}
