//
//  HomeCollectionViewCell.swift
//  BaiTapTongHop
//
//  Created by PCI0018 on 11/26/19.
//  Copyright © 2019 Asian Tech. All rights reserved.
//

import UIKit

protocol HomeCollectionViewCellDelegate: class {
    func addFavorite(view: HomeCollectionViewCell, needsPerform action: HomeCollectionViewCell.Action)
}

final class HomeCollectionViewCell: UICollectionViewCell {

    //MARK: - IBOulet 
    @IBOutlet private weak var thumbnailImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var addressLabel: UILabel!
    @IBOutlet private weak var ratingLabel: UILabel!
    @IBOutlet private weak var distanceLabel: UILabel!
    @IBOutlet private weak var favoriteButton: UIButton!
    
    enum Action {
        case addFavorite
    }
    
    weak var delegate: HomeCollectionViewCellDelegate?
    var viewModel: HomeCellViewModel? {
        didSet {
            setupUI()
        }
    }

    private func setupUI() {
        layer.cornerRadius = 5
        guard let viewModel = viewModel else { return }
        titleLabel.text = viewModel.title
        addressLabel.text = viewModel.address
        ratingLabel.text = "\(viewModel.rating)"
        distanceLabel.text = viewModel.distance
        favoriteButton.setImage(UIImage(named: viewModel.favoriteImage()), for: .normal)
    }
    
    @IBAction func favoriteButtonTouchUpInside(_ sender: Any) {
        delegate?.addFavorite(view: self, needsPerform: .addFavorite)
    }
}
