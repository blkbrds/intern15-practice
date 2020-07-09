//
//  CustomTableViewCell.swift
//  MVVM
//
//  Created by PCI0019 on 7/7/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit
protocol HomeTableViewCellDelegate: class  {
    func passValueToHomeViewController(cell: HomeTableViewCell, isFavorite: Bool)
}
class HomeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var caffeeImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var favoritesButton: UIButton!
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
        caffeeImageView.image = UIImage(named: viewModel.imageName)
        favoritesButton.isSelected = viewModel.isFavorite
    }
    
    @IBAction func favoritesButtonTouchUpInside(_ sender: Any) {
        guard let delegate = delegate else { return }
        favoritesButton.isSelected = !favoritesButton.isSelected
        delegate.passValueToHomeViewController(cell: self, isFavorite: favoritesButton.isSelected)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
