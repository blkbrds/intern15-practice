//
//  HomeCollectionViewCell.swift
//  BaiTapCusTomCell
//
//  Created by PCI0012 on 5/28/20.
//  Copyright © 2020 PCI0012. All rights reserved.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameTitleLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    var homeCollectionViewModel: HomeCollectionCellViewModel? {
        didSet {
            updateView()
        }
    }
    
    private func updateView() {
        guard let homeCollectionViewModel = homeCollectionViewModel else {
            return
        }
        avatarImageView.image = UIImage(named: "\(homeCollectionViewModel.avatarName)")
        nameTitleLabel.text = homeCollectionViewModel.nameTitle
        addressLabel.text = homeCollectionViewModel.address
    }
}
