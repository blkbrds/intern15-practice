//
//  SlideImageCell.swift
//  ExerciseMVVM
//
//  Created by PCI0002 on 12/13/19.
//  Copyright © 2019 TranVanTien. All rights reserved.
//

import UIKit

final class SlideImageCell: UICollectionViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var locationImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    // MARK: - Properties
    var viewModel: SlideImageCellViewModel? {
        didSet {
            updateUI()
        }
    }
    
    // MARK: - Public funcs
    func updateUI() {
        guard let viewModel = viewModel else { return  }
        let imageName = viewModel.imageName
        locationImageView.image = UIImage(named: imageName)
    }
}
