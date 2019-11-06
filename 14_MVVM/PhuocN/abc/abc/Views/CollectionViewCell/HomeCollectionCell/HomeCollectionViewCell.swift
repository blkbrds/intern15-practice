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
    
    @IBOutlet private weak var distanceLabel: UILabel!
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
        layer.borderColor = App.Color.tintColorTabBar.cgColor
        layer.borderWidth = 0.5
    }
    
    private func updateUI() {
        guard let viewModel = viewModel else { return }
        channelLabel.text = viewModel.channel
        titleLabel.text = viewModel.title
        pusblishedLabel.text = viewModel.published
       
    }
}
