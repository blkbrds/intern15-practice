//
//  DetailTableViewCell.swift
//  BaiTapTongHop
//
//  Created by ANH NGUYỄN on 1/8/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

final class DetailTableViewCell: UITableViewCell {
    
    @IBOutlet private weak  var imgaeDetailView: UIImageView!
    @IBOutlet private weak var statusLabel: UILabel!
    @IBOutlet private weak var nameImageLabel: UILabel!
    @IBOutlet private weak var daysAgoLabel: UILabel!

    func updateDetail(image: UIImage, status: String, name: String, day: Date) {
        nameImageLabel.text = name
        statusLabel.text = status
        imgaeDetailView.image = image
        daysAgoLabel.text = "\(day)"
    }
}
