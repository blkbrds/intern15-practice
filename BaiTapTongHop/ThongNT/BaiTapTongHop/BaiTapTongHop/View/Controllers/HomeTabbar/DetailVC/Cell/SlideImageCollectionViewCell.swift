//
//  SlideImageCollectionViewCell.swift
//  BaiTapTongHop
//
//  Created by PhuocNguyen on 12/25/19.
//  Copyright © 2019 Asian Tech. All rights reserved.
//

import UIKit

final class SlideImageCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var makerImageView: UIImageView!

    var imageString: String? {
        didSet {
            updateUI()
        }
    }

    func updateUI() {
        makerImageView.setImageWithPath(urlString: imageString)
    }
}
