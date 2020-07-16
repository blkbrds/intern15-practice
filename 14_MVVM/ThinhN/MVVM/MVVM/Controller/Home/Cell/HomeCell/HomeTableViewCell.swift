//
//  CustomTableViewCell.swift
//  MVVM
//
//  Created by PCI0019 on 7/7/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit
protocol HomeTableViewCellDelegate: class  {
    func cell(_ cell: HomeTableViewCell, needPerforms action: HomeTableViewCell.Action)
}

class HomeTableViewCell: UITableViewCell {
    
    enum Action {
        case favorite(isFavorite: Bool)
    }
    
    @IBOutlet weak var coffeeImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    weak var delegate: HomeTableViewCellDelegate?
    
    var viewModel: HomeCellViewModel? {
        didSet {
            updateView()
        }
    }
    func updateView() {
        guard let viewModel = viewModel else { return }
        titleLabel.text = viewModel.title
        addressLabel.text = viewModel.address
        ratingLabel.text = viewModel.rating
        distanceLabel.text = viewModel.distance
        coffeeImageView.image = UIImage(named: viewModel.imageName)
        favoriteButton.isSelected = viewModel.isFavorite
    }
    
    @IBAction func favoritesButtonTouchUpInside(_ sender: Any) {
        guard let delegate = delegate  else { return }
        favoriteButton.isSelected = !favoriteButton.isSelected
        delegate.cell(self, needPerforms: .favorite(isFavorite: true))
    }
}
