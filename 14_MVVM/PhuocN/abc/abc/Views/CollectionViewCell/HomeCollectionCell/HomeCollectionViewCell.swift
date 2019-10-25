//
//  HomeCollectionViewCell.swift
//  abc
//
//  Created by PhuocNguyen on 10/24/19.
//  Copyright © 2019 PhuocNguyen. All rights reserved.
//

import UIKit

final class HomeCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var distanceLabel: UILabel!
    @IBOutlet private weak var favoriteButton: UIButton!
    @IBOutlet private weak var rateLabel: UILabel!
    @IBOutlet private weak var addressLabel: UILabel!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var avatarImageView: UIImageView!
    
    var viewModel: HomeCollectionCellViewModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setupUI() {
        layer.borderColor = AppColor.tintColorTabBar.cgColor
        layer.borderWidth = 0.5
        guard let viewModel = viewModel else {
            print("Fail")
            return
        }
        distanceLabel.text = viewModel.data.distance
        nameLabel.text = viewModel.data.name
        addressLabel.text = viewModel.data.address
        rateLabel.text = viewModel.data.rates
        avatarImageView.image = UIImage(named: viewModel.data.avatar)
        if viewModel.data.isFavorite {
            favoriteButton.setImage(#imageLiteral(resourceName: "ic-like-selected"), for: .normal)
        } else {
            favoriteButton.setImage(#imageLiteral(resourceName: "ic-like"), for: .normal)
        }
    }
    
    @IBAction private func handleFavoriteButtonTouchUpInside(_ sender: Any) {
        guard let viewModel = viewModel else { return }
        if viewModel.data.isFavorite {
            viewModel.unlike()
            favoriteButton.setImage(#imageLiteral(resourceName: "ic-like"), for: .normal)
        } else {
            viewModel.likeItem()
            favoriteButton.setImage(#imageLiteral(resourceName: "ic-like-selected"), for: .normal)
        }
    }
}
