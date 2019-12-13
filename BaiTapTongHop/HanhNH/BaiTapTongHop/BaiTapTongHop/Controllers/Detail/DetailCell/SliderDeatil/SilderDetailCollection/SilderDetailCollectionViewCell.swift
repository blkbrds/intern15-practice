//
//  SilderDetailCollectionViewCell.swift
//  Bai_Tap_14
//
//  Created by ANH NGUYỄN on 12/11/19.
//  Copyright © 2019 asiantech. All rights reserved.
//

import UIKit

class SilderDetailCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageDetail: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func updateDetail(image: String) {
        imageDetail.image = UIImage(named: image)
    }
}
