//
//  CoffeeCollectionViewCell.swift
//  MVVM
//
//  Created by Ngoc Hien on 2/24/20.
//  Copyright © 2020 NgocHien. All rights reserved.
//

import UIKit

final class CoffeeCollectionViewCell: UICollectionViewCell {
	var viewModel: CoffeeCollectionViewModel? {
		didSet {
			updateData()
		}
	}

	@IBOutlet weak var coffeeImage: UIImageView!

	override func awakeFromNib() {
		super.awakeFromNib()
	}

	func updateData() {
		coffeeImage.image = UIImage(named: viewModel!.imageCoffee)
	}
}
