//
//  SliderDetailCollectionViewCell.swift
//  BaiTapTongHop
//
//  Created by ANH NGUYỄN on 1/6/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit
protocol SliderDeatilDelegate: class {
    func cell(indexPath: IndexPath)
}
final class SliderDetailCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var scrollView: UIScrollView!
    @IBOutlet private weak var imageCollectionView: UIImageView!

    func updateCollection(image: String?) {
        imageCollectionView.image = UIImage(named: image!)
    }
}
