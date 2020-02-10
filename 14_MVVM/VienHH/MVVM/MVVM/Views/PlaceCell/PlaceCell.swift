//
//  PlaceCell.swift
//  MVVM
//
//  Created by user on 2/6/20.
//  Copyright © 2020 VienH. All rights reserved.
//

import UIKit

protocol PlaceCellDelegate: class {
    func viewCell(viewCell: PlaceCell, needPermorAction action: PlaceCell.Action)
}

final class PlaceCell: UICollectionViewCell {

    enum Action {
        case changeFavorites
    }
    
    @IBOutlet private weak var favoritesButton: UIButton!
    @IBOutlet private weak var distanceLabel: UILabel!
    @IBOutlet private weak var ratingLabel: UILabel!
    @IBOutlet private weak var addressLabel: UILabel!
    @IBOutlet private weak var namePlaceLabel: UILabel!
    @IBOutlet private weak var placeImageView: UIImageView!
    
    weak var delegate: PlaceCellDelegate?
    var viewModel: PlaceCellViewModel? {
        didSet {
            updateUI()
        }
    }
    
    private func updateUI() {
        guard let viewModel = viewModel else { return }
        let placeImageName = viewModel.placeImageName
        let namePlace = viewModel.namePlace
        let address = viewModel.address
        let rating = viewModel.rating
        let distance = viewModel.distance
        let favoritesImageName = viewModel.favoritesImage
        
        placeImageView.image = UIImage(named: placeImageName)
        namePlaceLabel.text = namePlace
        addressLabel.text = address
        ratingLabel.text = rating
        distanceLabel.text = distance
        favoritesButton.isSelected = viewModel.isFavorites
        favoritesButton.setImage(UIImage(named: favoritesImageName), for: .selected)
    }
    
    @IBAction func favoritesTouchUpInside(_ sender: Any) {
        guard let viewModel = viewModel else { return }
        print(viewModel.isFavorites)
        delegate?.viewCell(viewCell: self, needPermorAction: .changeFavorites)
    }
}
