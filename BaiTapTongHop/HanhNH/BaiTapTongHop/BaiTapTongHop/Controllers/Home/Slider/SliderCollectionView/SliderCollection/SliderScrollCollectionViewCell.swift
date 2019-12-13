//
//  SliderScrollCollectionViewCell.swift
//  Bai_Tap_14
//
//  Created by ANH NGUYỄN on 12/9/19.
//  Copyright © 2019 asiantech. All rights reserved.
//

import UIKit

final class SliderScrollCollectionViewCell: UICollectionViewCell {

    @IBOutlet private weak var scrollView: UIScrollView!
    @IBOutlet private weak var imageCollectionView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func updateCollection(image: String?) {
        imageCollectionView.image = UIImage(named: image!)
    }
}
