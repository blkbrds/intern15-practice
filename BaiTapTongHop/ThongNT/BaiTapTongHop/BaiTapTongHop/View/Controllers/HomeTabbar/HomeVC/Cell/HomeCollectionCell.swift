//
//  HomeCollectionCell.swift
//  BaiTapTongHop
//
//  Created by PCI0018 on 11/26/19.
//  Copyright © 2019 Asian Tech. All rights reserved.
//

import UIKit
import SDWebImage

protocol HomeCollectionCellDelegate: class {
    func cell(cell: HomeCollectionCell, needsPerform action: HomeCollectionCell.Action)
}

final class HomeCollectionCell: UICollectionViewCell {

    enum Action {
        case addFavorite
    }

    //MARK: - IBOulet
    @IBOutlet private weak var thumbnailImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var addressLabel: UILabel!
    @IBOutlet private weak var ratingLabel: UILabel!
    @IBOutlet private weak var distanceLabel: UILabel!
    @IBOutlet private weak var favoriteButton: UIButton!

    weak var delegate: HomeCollectionCellDelegate?
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
        distanceLabel.text = "\(viewModel.distance) m"
        thumbnailImageView.setImageWithPath(urlString: viewModel.iconString)
        favoriteButton.setImage(UIImage(named: viewModel.favoriteImage), for: .normal)
    }

    @IBAction private func favoriteButtonTouchUpInside(_ sender: Any) {
        delegate?.cell(cell: self, needsPerform: .addFavorite)
    }
}
