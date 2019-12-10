//
//  HomeTableViewCell.swift
//  Bai_Tap_14
//
//  Created by ANH NGUYỄN on 12/6/19.
//  Copyright © 2019 asiantech. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var nameImageView: UILabel!
    @IBOutlet weak var addressImageView: UIImageView!
    
    var viewModelCell: HomeCellTabelViewModel? {
        didSet {
            updateTabViewCell()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    private func updateTabViewCell() {
        if  let viewModelCell = viewModelCell {
            addressImageView.image = viewModelCell.thumnailImage
            distanceLabel.text = String(viewModelCell.distance) + " km"
            nameImageView.text = viewModelCell.name
            valueLabel.text = viewModelCell.rating
            addressLabel.text = viewModelCell.addres
        } else {
            print("nil")
        }
    }
}
