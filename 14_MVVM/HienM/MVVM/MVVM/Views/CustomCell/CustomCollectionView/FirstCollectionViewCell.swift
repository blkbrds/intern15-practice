//
//  FirstCollectionViewCell.swift
//  MVVM
//
//  Created by Ngoc Hien on 2/21/20.
//  Copyright © 2020 NgocHien. All rights reserved.
//

import UIKit

class FirstCollectionViewCell: UICollectionViewCell {
	
	var viewModel : FirstCollectionViewModel? {
		didSet {
			updateData()
		}
	}
	
	@IBOutlet weak var imageCoffeeL: UIImageView!
	@IBOutlet weak var ratingL: UILabel!
	@IBOutlet weak var nameCoffeeL: UILabel!
	@IBOutlet weak var adressCoffeeeL: UILabel!
	@IBOutlet weak var favoriteBtn: UIButton!
	var tapping : Bool = true
	
	override func awakeFromNib() {
        super.awakeFromNib()
      
    }
	private func updateData() {
		imageCoffeeL.image = UIImage(named: viewModel!.imageCoffee)
		nameCoffeeL.text = viewModel?.nameCoffee
		adressCoffeeeL.text = viewModel?.addressCoffee
		ratingL.text = viewModel?.rating
	}
	
	@IBAction func favoriteBtnTapped(_ sender: UIButton) {
		if tapping {
			favoriteBtn.setImage(UIImage(named: "star"), for: .normal)
			tapping = false
		}else {
			favoriteBtn.setImage(UIImage(named: "star.fill"), for: .normal)
			tapping = true
		}
	}
}
