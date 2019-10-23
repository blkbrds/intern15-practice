//
//  PhotoCollectionViewCell.swift
//  CollectionViewFlowLayout
//
//  Created by PhuocNguyen on 10/21/19.
//  Copyright © 2019 PhuocNguyen. All rights reserved.
//

import UIKit

final class PhotoCollectionViewCell: UICollectionViewCell {

    @IBOutlet private weak var photoImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        photoImageView.layer.cornerRadius = 15
    }
    
    func configPhotoImage(image: UIImage?) {
        photoImageView.image = image
    }
}
