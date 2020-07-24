//
//  HomeTableViewCell.swift
//  API
//
//  Created by PCI0019 on 7/24/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    
    @IBOutlet weak var imageSongView: UIImageView!
    @IBOutlet weak var nameSongLabel: UILabel!
    @IBOutlet weak var singerNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
