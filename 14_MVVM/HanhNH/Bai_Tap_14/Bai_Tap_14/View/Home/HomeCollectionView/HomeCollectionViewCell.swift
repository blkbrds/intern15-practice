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
    
    var viewModelCollection: HomeCellTabelViewModel? {
        didSet {
            updateCollectionView()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    private func updateCollectionView() {
        if let viewModelCollection = viewModelCollection {
            addressImageView.image = viewModelCollection.thumnailImage
            nameAddressLabel.text = viewModelCollection.name
            addressLabel.text = viewModelCollection.addres
            distanceLabel.text = String(viewModelCollection.distance) + " km"
            valueLabel.text = viewModelCollection.rating
        } else {
            print("sai roi")
        }
    }
}
