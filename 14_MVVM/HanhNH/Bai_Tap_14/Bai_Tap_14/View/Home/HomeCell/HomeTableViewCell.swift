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
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func updateTabViewCell(avatar: String, name: String, distance: String, value: String, address: String) {
        addressImageView.image = UIImage(named: avatar)
        nameImageView.text = name
        distanceLabel.text = distance
        valueLabel.text = value
        addressLabel.text = address
    }
}
