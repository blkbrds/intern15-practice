//
//  PhotoCollectionViewCell.swift
//  Baitap02
//
//  Created by PCI0008 on 1/16/20.
//  Copyright © 2020 PCI0008. All rights reserved.
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
