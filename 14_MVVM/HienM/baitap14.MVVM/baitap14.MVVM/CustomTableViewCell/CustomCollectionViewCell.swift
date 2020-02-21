//
//  CustomCollectionViewCell.swift
//  baitap14.MVVM
//
//  Created by Ngoc Hien on 2/19/20.
//  Copyright © 2020 NgocHien. All rights reserved.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
	@IBOutlet weak var coffeeImage: UIImageView!
	var viewModel: CustomCollectionViewModel? {
		didSet {
			configData()
		}

	}
	override func awakeFromNib() {
		super.awakeFromNib()

	}
	func configData(){
		self.coffeeImage.image = UIImage(named: viewModel!.image)
	}

}
