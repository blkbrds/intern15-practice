//
//  HomeTableViewCell.swift
//  baitap14.MVVM
//
//  Created by Ngoc Hien on 2/20/20.
//  Copyright © 2020 NgocHien. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
	var viewModel: HomeTableViewModel? {
		didSet {
			updateUI()
		}
	}

	@IBOutlet weak var avatarImageView: UIImageView!
	@IBOutlet weak var nameCoffeeLabel: UILabel!
	
	@IBOutlet weak var ratingLabel: UILabel!
	@IBOutlet weak var addressCoffeeLabel: UILabel!
	override func awakeFromNib() {
        super.awakeFromNib()
      
		
    }
	func updateUI() {
		self.avatarImageView.image = UIImage(named: viewModel!.caffeeImage)
		self.nameCoffeeLabel.text = viewModel?.name
		self.addressCoffeeLabel.text = viewModel?.addressL
		self.ratingLabel.text = viewModel?.rateL
	}

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }
    
	@IBAction func favoriteButtonTap(_ sender: Any) {
	}
}
