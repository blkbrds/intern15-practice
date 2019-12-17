//
//  LocationCell.swift
//  ExerciseMVVM
//
//  Created by PCI0002 on 12/13/19.
//  Copyright © 2019 TranVanTien. All rights reserved.
//

import UIKit

final class LocationCell: UICollectionViewCell {

    // MARK: - IBOutlets
    @IBOutlet private weak var locationImageView: UIImageView!
    @IBOutlet private weak var nameLocationLabel: UILabel!
    @IBOutlet private weak var addressLabel: UILabel!
    @IBOutlet private weak var ratingLabel: UILabel!
    @IBOutlet private weak var distanceLabel: UILabel!
    @IBOutlet private weak var favoritesImageView: UIImageView!
    
    // MARK: - Properties
    var viewModel: LocationCellViewModel? {
        didSet {
            updateUI()
        }
    }
    
    // MARK: - Public funcs
    func updateUI() {
        guard let viewModel = viewModel else { return  }
        let locationImageName = viewModel.locationImageName
        let nameLocation = viewModel.nameLocation
        let address = viewModel.address
        let rating = viewModel.rating
        let distance = viewModel.distance
        
        locationImageView.image = UIImage(named: locationImageName)
        nameLocationLabel.text = nameLocation
        addressLabel.text = address
        ratingLabel.text = rating
        distanceLabel.text = distance
    }
}
