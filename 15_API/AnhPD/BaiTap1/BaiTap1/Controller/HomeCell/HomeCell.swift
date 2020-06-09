//
//  HomeCell.swift
//  BaiTap1
//
//  Created by PCI0012 on 6/4/20.
//  Copyright © 2020 PCI0012. All rights reserved.
//

import UIKit

class HomeCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    
    var viewModel: HomeCellViewModel? {
        didSet {
            updateView()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    private func updateView() {
        guard let viewModel = viewModel else {
            return
        }
        titleLabel.text = viewModel.music.name
        artistNameLabel.text = viewModel.music.artistName
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
