//
//  SliderScrollCollectionViewCell.swift
//  BaiTapTongHop
//
//  Created by ANH NGUYỄN on 1/6/20.
//  Copyright © 2020 asiantech. All rights reserved.
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
