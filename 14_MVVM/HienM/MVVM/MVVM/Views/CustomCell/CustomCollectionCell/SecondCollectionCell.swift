//
//  SecondCollectionCell.swift
//  MVVM
//
//  Created by Ngoc Hien on 2/21/20.
//  Copyright © 2020 NgocHien. All rights reserved.
//

import UIKit

class SecondCollectionCell: UICollectionViewCell {

	@IBOutlet weak var coffeeImageL: UIImageView!
	@IBOutlet weak var coffeeNameL: UILabel!
	@IBOutlet weak var coffeeAddressL: UILabel!
	@IBOutlet weak var ratingL: UILabel!
	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
	
	@IBAction func favoriteBtnTapped(_ sender: Any) {
	}
	
}
