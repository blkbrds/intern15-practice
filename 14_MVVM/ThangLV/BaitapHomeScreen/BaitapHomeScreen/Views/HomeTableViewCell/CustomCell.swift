//
//  CustomCell.swift
//  BaitapHomeScreen
//
//  Created by PCI0008 on 2/4/20.
//  Copyright © 2020 PCI0008. All rights reserved.
//

import UIKit

final class CustomCell: UICollectionViewCell {
    
    // MARK: - IBOutlet
    @IBOutlet private weak var descriptionImageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var favoriteButton: UIButton!
    @IBOutlet private weak var addressLabel: UILabel!
    @IBOutlet private weak var ratingLabel: UILabel!
    @IBOutlet private weak var distanceLabel: UILabel!
    @IBOutlet private weak var favoriteImageView: UIImageView!
    
    var viewModel = CustomCellViewModel() {
        didSet {
            configData()
        }
    }
    
    // MARK: - Override functions
    override func awakeFromNib() {
        super.awakeFromNib()
        configData()
        favoriteImageView.tintColor = .yellow
    }
    
    // MARK: - Private functions
    private func configData() {
        if let home = viewModel.home, home.isLiked {
            favoriteImageView.image = UIImage.init(systemName: "star.fill")
        } else {
            favoriteImageView.image = UIImage.init(systemName: "star")
        }
    }
    
    //MARK: - IBAction
    @IBAction private func favoriteButtonTouchUpInside(_ sender: Any) {
        if favoriteButton.isSelected == true {
            favoriteImageView.image = UIImage.init(systemName: "star.fill")
            favoriteButton.isSelected = false
        } else {
            favoriteImageView.image = UIImage.init(systemName: "star")
            favoriteButton.isSelected = true
        }
    }
}
