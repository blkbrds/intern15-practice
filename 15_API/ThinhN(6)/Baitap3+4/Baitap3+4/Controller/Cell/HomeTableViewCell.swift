//
//  HomeTableViewCell.swift
//  Baitap3+4
//
//  Created by ADMIN on 8/12/2563 BE.
//  Copyright © 2563 BE asiantech. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var titleVideoLabel: UILabel!
    @IBOutlet weak var channelTitleLabel: UILabel!
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var publishedAtLabel: UILabel!
    
    var viewModel: HomeCellViewModel? {
        didSet {
            updateUI()
        }
    }

    func updateUI() {
        guard let viewModel = viewModel else {return }
        let dataAPI = viewModel.dataAPI
        titleVideoLabel.text = dataAPI.titleVideo
        channelTitleLabel.text = dataAPI.channelTitle
        publishedAtLabel.text = dataAPI.publishedAt
        
        viewModel.loadImage { [weak self ] image in
            guard let self = self else {return}
            self.thumbnailImageView.image = image
        }
    }
}
