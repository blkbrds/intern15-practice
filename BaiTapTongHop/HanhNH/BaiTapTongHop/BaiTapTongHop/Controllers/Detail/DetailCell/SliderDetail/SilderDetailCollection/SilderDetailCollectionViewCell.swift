//
//  SliderDetailCollectionViewCell.swift
//  BaiTapTongHop
//
//  Created by ANH NGUYỄN on 1/6/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

final class SliderDetailCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var scrollView: UIScrollView!
    @IBOutlet private weak var imageCollectionView: UIImageView!
    
    var viewModel: SilderDetailCollectionViewCellViewModel? {
        didSet {
            updateCollection()
        }
    }
    
    func updateCollection() {
        if let viewModel = viewModel {
            imageCollectionView.image = UIImage(named: viewModel.imageName)
        }
    }
}
