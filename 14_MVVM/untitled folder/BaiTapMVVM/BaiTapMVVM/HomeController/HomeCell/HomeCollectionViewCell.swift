//
//  HomeCollectionViewCell.swift
//  BaiTapMVVM
//
//  Created by PCI0012 on 6/2/20.
//  Copyright © 2020 PCI0012. All rights reserved.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameTitleLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var kmLabel: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    var homeCellViewModel: HomeCellViewModel? {
        didSet {
            updateView()
        }
    }
    
    private func updateView() {
        guard let homeCellViewModel = homeCellViewModel  else {
            return
        }
        avatarImageView.image = UIImage(named: homeCellViewModel.cafe.avatarName)
        nameTitleLabel.text = homeCellViewModel.cafe.nameTitle
        addressLabel.text = homeCellViewModel.cafe.address
        kmLabel.text = homeCellViewModel.cafe.km
        favoriteButton.isSelected = homeCellViewModel.cafe.isFavorite
    }
    
    @IBAction func favoriteButtonTouchUpInSide(_ sender: Any) {
        guard let homeCellViewModel = homeCellViewModel  else {
            return
        }
        favoriteButton.isSelected = !homeCellViewModel.cafe.isFavorite
        homeCellViewModel.cafe.isFavorite = !homeCellViewModel.cafe.isFavorite
    }
}
