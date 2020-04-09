//
//  HomeCollectionViewCell.swift
//  BaiTapMVVM
//
//  Created by Sếp Quân on 4/9/20.
//  Copyright © 2020 QuanBT. All rights reserved.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var rateLabel: UILabel!
    @IBOutlet weak var rangeLabel: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    var viewModel = HomeCellModel() {
        didSet {
            updateView()
        }
    }
    
    // MARK: - updateView
    private func updateView() {
        let data = viewModel.data
        nameLabel.text = data.name
        imageView.image = UIImage(named: data.image)
        addressLabel.text = data.address
        rateLabel.text = data.rate
        rangeLabel.text = data.range
    }
}
