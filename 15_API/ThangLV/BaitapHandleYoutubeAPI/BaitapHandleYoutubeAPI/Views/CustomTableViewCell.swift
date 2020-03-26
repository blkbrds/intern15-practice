//
//  CustomTableViewCell.swift
//  BaitapHandleYoutubeAPI
//
//  Created by PCI0008 on 2/12/20.
//  Copyright © 2020 PCI0008. All rights reserved.
//

import UIKit

final class CustomTableViewCell: UITableViewCell {
     
    @IBOutlet private weak var thumbnailImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var publishedAtLabel: UILabel!
    
    var viewModel = CustomCellViewModel() {
        didSet {
            updateView()
        }
    }
    
    private func updateView() {
        titleLabel.text = viewModel.title
        publishedAtLabel.text = viewModel.publishedAt
    }
    
    func configData(image: UIImage?) {
        thumbnailImageView.image = image
    }
}

