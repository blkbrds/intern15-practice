//
//  DetailTableViewCell.swift
//  Bai_Tap_14
//
//  Created by ANH NGUYỄN on 12/11/19.
//  Copyright © 2019 asiantech. All rights reserved.
//

import UIKit

class DetailTableViewCell: UITableViewCell {

    @IBOutlet weak var imgaeDetailView: UIImageView!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var nameImageLabel: UILabel!
    @IBOutlet weak var daysAgoLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        nameImageLabel.font = UIFont.boldSystemFont(ofSize: 16.0)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func updateDetail(image: UIImage, status: String, name: String, day: Date) {
        nameImageLabel.text = name
        statusLabel.text = status
        imgaeDetailView.image = image
        daysAgoLabel.text = "\(day)"
    }
}
