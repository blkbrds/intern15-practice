//
//  HomeCollectionViewCell.swift
//  MVVM
//
//  Created by ADMIN on 7/8/2563 BE.
//  Copyright © 2563 BE asiantech. All rights reserved.
//

import UIKit

protocol HomeCollectionViewCellDelegate: class  {
    func cell(_ cell: HomeCollectionViewCell, needPerforms action: HomeTableViewCell.Action)
}

class HomeCollectionViewCell: UICollectionViewCell {
    
    enum Action {
        case favorite(isFavorite: Bool)
    }
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var favoritesButton: UIButton!
    weak var delegate: HomeCollectionViewCellDelegate?
    
    var viewModel: HomeCellViewModel? {
        didSet {
            updateView()
        }
    }
    
    func updateView() {
        guard let viewModel = viewModel else { return }
        titleLabel.text = viewModel.title
        locationLabel.text = viewModel.address
        distanceLabel.text = viewModel.distance
        imageView.image = UIImage(named: viewModel.imageName)
        ratingLabel.text = viewModel.rating
        favoritesButton.isSelected = viewModel.isFavorite
    }
    
    @IBAction func favoritesButtonTouchUpInside(_ sender: Any) {
        guard let delegate = delegate else { return }
        favoritesButton.isSelected = !favoritesButton.isSelected
        delegate.cell(self, needPerforms: .favorite(isFavorite: true))
    }
}
