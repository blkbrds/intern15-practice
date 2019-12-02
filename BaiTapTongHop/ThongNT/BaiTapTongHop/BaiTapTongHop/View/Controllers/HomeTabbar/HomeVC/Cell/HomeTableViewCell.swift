//
//  HomeTableViewCell.swift
//  BaiTapTongHop
//
//  Created by PCI0018 on 11/25/19.
//  Copyright © 2019 Asian Tech. All rights reserved.
//

import UIKit

protocol HomeTableViewCellDelegate: class {
    func cell(cell: HomeTableViewCell, needsPerform action: HomeTableViewCell.Action)
}

final class HomeTableViewCell: TableCell {

    //MARK: - IBOulet
    @IBOutlet private weak var favoriteButton: UIButton!
    @IBOutlet private weak var thumbnailImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var addressLabel: UILabel!
    @IBOutlet private weak var ratingLabel: UILabel!
    @IBOutlet private weak var distanceLabel: UILabel!
    
    enum Action {
        case addFavorite
    }
    
    weak var delegate: HomeTableViewCellDelegate?
    var viewModel: HomeCellViewModel? {
        didSet {
            setupUI()
        }
    }
    
    private func setupUI() {
        selectionStyle = .none
        guard let viewModel = viewModel else { return }
        titleLabel.text = viewModel.title
        addressLabel.text = viewModel.address
        ratingLabel.text = "\(viewModel.rating)"
        distanceLabel.text = viewModel.distance
        favoriteButton.isSelected = viewModel.favorite
        favoriteButton.setImage(UIImage(named: viewModel.favoriteImage()), for: .selected)
    }
    
    @IBAction func favortieButtonTouchUpInside(_ sender: Any) {
        delegate?.cell(cell: self, needsPerform: .addFavorite)
    }
}
