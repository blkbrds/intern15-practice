//
//  CollectionViewCell.swift
//  baitap14.MVVM
//
//  Created by Ngoc Hien on 2/19/20.
//  Copyright © 2020 NgocHien. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
	var viewModel: CollectionViewModel? {
		didSet {
			configData()
		}
	}

	@IBOutlet weak var pictureImage: UIImageView!
	override func awakeFromNib() {
		super.awakeFromNib()
	}

	func configData() {
		pictureImage.image = UIImage(named: viewModel!.image)
	}
}
