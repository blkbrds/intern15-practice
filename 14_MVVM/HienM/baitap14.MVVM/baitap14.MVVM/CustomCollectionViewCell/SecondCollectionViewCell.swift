//
//  SecondCollectionViewCell.swift
//  baitap14.MVVM
//
//  Created by Ngoc Hien on 2/19/20.
//  Copyright © 2020 NgocHien. All rights reserved.
//

import UIKit

class SecondCollectionViewCell: UICollectionViewCell {
	var tapping = true


	@IBOutlet weak var caffeeImage: UIImageView!
	@IBOutlet weak var namecoffeeLabel: UILabel!
	@IBOutlet weak var addressLabel: UILabel!
	@IBOutlet weak var ratingLabel: UILabel!
	@IBOutlet weak var favoriteButton: UIButton!
	var viewModel: SecondCollectionViewModel? {
		didSet {
			updateUI()
		}
	}


	@IBAction func favorriteButton(_ sender: Any) {
		favoriteButton.backgroundColor = .red
	}

	func updateUI() {
		self.caffeeImage.image = UIImage(named: viewModel!.caffeeImage)
		self.addressLabel.text = viewModel?.addressL
		self.ratingLabel.text = viewModel?.rateL
		self.namecoffeeLabel.text = viewModel?.name
	}
}
