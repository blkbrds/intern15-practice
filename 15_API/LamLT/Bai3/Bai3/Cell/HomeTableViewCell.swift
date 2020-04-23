//
//  HomeTableViewCell.swift
//  Bai3
//
//  Created by PCI0002 on 4/22/20.
//  Copyright © 2020 LeThanhLam. All rights reserved.
//

import UIKit

final class HomeTableViewCell: UITableViewCell {
   
    // MARK: - IBOutlet
    @IBOutlet weak var cellImageView: UIImageView!
    @IBOutlet weak var publishedAtLabel: UILabel!
    @IBOutlet weak var titleChannelLabel: UILabel!
    @IBOutlet weak var titleVideoLabel: UILabel!
    
    // MARK: - Properties
    var viewModel = HomeCellViewModel() {
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
        
        print(dataAPI.titleVideo, dataAPI.channelTitle, dataAPI.publishedAt)
    }
    
    func configImage(image: UIImage?) {
        cellImageView.image = image
    }
}

