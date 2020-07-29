//
//  HomeTableTableViewCell.swift
//  Baitap3API
//
//  Created by ADMIN on 7/28/2563 BE.
//  Copyright © 2563 BE asiantech. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var titleVideoLabel: UILabel!
    @IBOutlet weak var channelTitleLabel: UILabel!
    @IBOutlet weak var publishedAtLabel: UILabel!
    @IBOutlet weak var cellImageView: UIImageView!
    
    var viewModel = HomeCellViewModel() {
        didSet {
            configTableView()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    func configTableView() {
        let dataAPI = viewModel.dataAPI
        titleVideoLabel.text = dataAPI.titleVideo
        channelTitleLabel.text = dataAPI.channelTitle
        publishedAtLabel.text = dataAPI.publishedAt
    }
    func configImage(image: UIImage?) {
        cellImageView.image = image
    }
}
