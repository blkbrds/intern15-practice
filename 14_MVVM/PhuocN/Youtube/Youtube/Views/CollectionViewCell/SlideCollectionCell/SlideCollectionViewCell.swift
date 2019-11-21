//
//  SlideCollectionViewCell.swift
//  abc
//
//  Created by PhuocNguyen on 10/24/19.
//  Copyright © 2019 PhuocNguyen. All rights reserved.
//

import UIKit

final class SlideCollectionViewCell: UICollectionViewCell {

    @IBOutlet private weak var imageView: UIImageView!
  
    func setupImage(with image: UIImage?) {
        self.imageView.image = image
    }
}
