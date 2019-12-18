//
//  LocationCell.swift
//  ExerciseMVVM
//
//  Created by PCI0002 on 12/13/19.
//  Copyright © 2019 TranVanTien. All rights reserved.
//

import UIKit

protocol LocationCellDelegate: class {
    func viewCell(viewCell: LocationCell, needPerformAction action: LocationCell.Action)
}

final class LocationCell: UICollectionViewCell {

    enum Action {
        case changeFavorites
    }

    // MARK: - IBOutlets
    @IBOutlet private weak var locationImageView: UIImageView!
    @IBOutlet private weak var nameLocationLabel: UILabel!
    @IBOutlet private weak var addressLabel: UILabel!
    @IBOutlet private weak var ratingLabel: UILabel!
    @IBOutlet private weak var distanceLabel: UILabel!
    @IBOutlet weak var favoritesButton: UIButton!

    weak var delegate: LocationCellDelegate?

    // MARK: - Properties
    var viewModel: LocationCellViewModel? {
        didSet {
            updateUI()
        }
    }

    // MARK: - Public funcs
    private func updateUI() {
        guard let viewModel = viewModel else { return }
        let locationImageName = viewModel.locationImageName
        let nameLocation = viewModel.nameLocation
        let address = viewModel.address
        let rating = viewModel.rating
        let distance = viewModel.distance
        let favoritesImageName = viewModel.favoritesImage

        locationImageView.image = UIImage(named: locationImageName)
        nameLocationLabel.text = nameLocation
        addressLabel.text = address
        ratingLabel.text = rating
        distanceLabel.text = distance
        favoritesButton.isSelected = viewModel.isFavorites
        favoritesButton.setImage(UIImage(named: favoritesImageName), for: .selected)
    }

    @IBAction private func favoritesTouchUpInside(_ sender: Any) {
        guard let viewModel = viewModel else { return }
        print(viewModel.isFavorites)
        delegate?.viewCell(viewCell: self, needPerformAction: .changeFavorites)
    }

}
