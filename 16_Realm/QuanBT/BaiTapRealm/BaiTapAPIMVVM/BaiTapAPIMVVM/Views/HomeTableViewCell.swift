//
//  HomeTableViewCell.swift
//  BaiTapAPIMVVM
//
//  Created by Sếp Quân on 4/24/20.
//  Copyright © 2020 QuanBT. All rights reserved.
//

import UIKit

final class HomeTableViewCell: UITableViewCell {
    // MARK: - IBOutlet
    @IBOutlet weak var cellImageView: UIImageView!
    @IBOutlet weak var publishedAtLabel: UILabel!
    @IBOutlet weak var titleChannelLabel: UILabel!
    @IBOutlet weak var titleVideoLabel: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    
    // MARK: - Properties
    var viewModel = HomeTableViewModel() {
        didSet {
            updateView()
        }
    }
    
    // MARK: - Override
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - Function
    private func updateView() {
        let dataAPI = viewModel.dataAPI
        titleVideoLabel.text = dataAPI.titleVideo
        titleChannelLabel.text = dataAPI.channelTitle
        publishedAtLabel.text = dataAPI.publishedAt
        if dataAPI.favorite {
            favoriteButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
        } else {
            favoriteButton.setImage(UIImage(systemName: "star"), for: .normal)
        }
    }
    
    func configImage(image: UIImage?) {
        cellImageView.image = image
    }
}
