//
//  HomeCollectionViewCell.swift
//  abc
//
//  Created by PhuocNguyen on 10/24/19.
//  Copyright © 2019 PhuocNguyen. All rights reserved.
//

import UIKit

protocol HomeCollectionCell: class {}

protocol HomeCollectionViewCellDelegate: class {
    func favoriteItem(at cell: UICollectionViewCell)
}

final class HomeCollectionViewCell: UICollectionViewCell, HomeCollectionCell {
    
    @IBOutlet private weak var pusblishedLabel: UILabel!
    @IBOutlet private weak var channelLabel: UILabel!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet weak var videoImageView: UIImageView!
    
    weak var delegate: HomeCollectionViewCellDelegate?
    var viewModel: HomeCollectionCellViewModel? {
        didSet {
            updateUI()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    private func setupUI() {
        backgroundColor = App.Color.backgroudColor
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        gradientLayer.locations = [0, 0.9]
        let width = UIScreen.main.bounds.width - 40
        gradientLayer.frame = CGRect(x: 0, y: 0, width: width, height: width * 0.6)
        videoImageView.layer.addSublayer(gradientLayer)
        layer.cornerRadius = 10
        clipsToBounds = true
    }
    
    private func updateUI() {
        guard let viewModel = viewModel else { return }
        channelLabel.text = viewModel.channel
        titleLabel.text = viewModel.title
        pusblishedLabel.text = viewModel.published
    }
}
