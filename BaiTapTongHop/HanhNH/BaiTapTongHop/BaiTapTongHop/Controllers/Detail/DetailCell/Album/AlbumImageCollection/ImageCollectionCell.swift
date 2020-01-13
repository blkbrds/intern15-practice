//
//  ImageCollectionCell.swift
//  BaiTapTongHop
//
//  Created by ANH NGUYỄN on 1/6/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

final class ImageCollectionCell: UICollectionViewCell {
    
    @IBOutlet private weak var scrollView: UIScrollView!
    @IBOutlet private weak var imageCollectionView: UIImageView!
    
    var viewModel: ImageCellViewModel? {
        didSet {
            updateView()
        }
    }
    
    private func updateView() {
        guard let viewModel = viewModel else { return }
        imageCollectionView.image = UIImage(named: viewModel.imageName)
    }
}
