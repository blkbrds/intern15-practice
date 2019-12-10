//
//  HomeCollectionViewCell.swift
//  Bai_Tap_14
//
//  Created by ANH NGUYỄN on 12/6/19.
//  Copyright © 2019 asiantech. All rights reserved.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var nameAddressLabel: UILabel!
    @IBOutlet weak var addressImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func updateCollectionView(image: UIImage, name: String, address: String, distrance: Float, value: String) {
        addressImageView.image = image
        nameAddressLabel.text = name
        addressLabel.text = address
        distanceLabel.text = String(distrance) + " km"
        valueLabel.text = value
    }
}
