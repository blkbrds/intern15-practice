//
//  CustomCell.swift
//  BaitapHomeScreen
//
//  Created by PCI0008 on 2/4/20.
//  Copyright © 2020 PCI0008. All rights reserved.
//

import UIKit

class CustomCell: UICollectionViewCell {
    
    // MARK: - IBOutlet
    @IBOutlet weak var descriptionImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var favoriteImageView: UIImageView!
    
    var viewModel = CustomCellViewModel() {
        didSet {
            configData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configData()
        favoriteImageView.tintColor = .yellow
    }
    
    private func configData() {
        if let home = viewModel.home, home.isLiked {
            favoriteImageView.image = UIImage.init(systemName: "star.fill")
        } else {
            favoriteImageView.image = UIImage.init(systemName: "star")
        }
    }
    
    //MARK: - IBAction
    @IBAction func favoriteButtonTouchUpInside(_ sender: Any) {
        if favoriteButton.isSelected == true {
            favoriteImageView.image = UIImage.init(systemName: "star.fill")
            favoriteButton.isSelected = false
        } else {
            favoriteImageView.image = UIImage.init(systemName: "star")
            favoriteButton.isSelected = true
        }
    }
}
