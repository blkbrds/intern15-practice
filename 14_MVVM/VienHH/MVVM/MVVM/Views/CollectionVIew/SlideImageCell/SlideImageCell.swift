//
//  SlideImageCell.swift
//  MVVM
//
//  Created by user on 2/5/20.
//  Copyright © 2020 VienH. All rights reserved.
//

import UIKit

final class SlideImageCell: UICollectionViewCell {

    @IBOutlet private weak var placeImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    // MARK: - Properties
    var viewModel: SlideImageCellViewModel? {
        didSet {
            guard let viewModel = viewModel else { return }
            let imageName = viewModel.imageName
            placeImageView.image = UIImage(named: imageName)
        }
    }
}
