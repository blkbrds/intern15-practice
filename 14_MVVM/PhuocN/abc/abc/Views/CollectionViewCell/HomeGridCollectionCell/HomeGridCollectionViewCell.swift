//
//  HomeGridCollectionViewCell.swift
//  abc
//
//  Created by PhuocNguyen on 10/24/19.
//  Copyright © 2019 PhuocNguyen. All rights reserved.
//

import UIKit

final class HomeGridCollectionViewCell: UICollectionViewCell {
    
    weak var delegate: HomeCollectionViewCellDelegate?
    var viewModel: HomeCollectionCellViewModel? {
        didSet {
            updateUI()
        }
    }
    
    @IBOutlet private weak var distanceLabel: UILabel!
    @IBOutlet private weak var favoriteButton: UIButton!
    @IBOutlet private weak var rateLabel: UILabel!
    @IBOutlet private weak var addressLabel: UILabel!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var avatarImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    private func setupUI() {
        layer.borderColor = App.Color.tintColorTabBar.cgColor
        layer.borderWidth = 0.5
    }
    
    private func updateUI() {
        guard let viewModel = viewModel else { return }
        distanceLabel.text = viewModel.distance
        nameLabel.text = viewModel.title
        addressLabel.text = viewModel.address
        rateLabel.text = viewModel.rating
        avatarImageView.image = UIImage(named: viewModel.image)
        updateFavoriteButton(isLike: viewModel.isFavorite)
    }
    
    private func updateFavoriteButton(isLike: Bool) {
        if isLike {
            favoriteButton.setImage(#imageLiteral(resourceName: "ic-like-selected"), for: .normal)
        } else {
            favoriteButton.setImage(#imageLiteral(resourceName: "ic-like"), for: .normal)
        }
    }
    
    @IBAction private func favoriteButtonTouchUpInside(_ sender: Any) {
        if let viewModel = viewModel {
            viewModel.setFavorite { (done, isLike) in
                if done {
                    updateFavoriteButton(isLike: isLike)
                } else {
                    print("Can not change favorite")
                }
            }
        }
    }
}
