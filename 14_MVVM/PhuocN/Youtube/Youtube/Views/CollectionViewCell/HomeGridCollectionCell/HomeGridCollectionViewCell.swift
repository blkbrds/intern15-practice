//
//  HomeGridCollectionViewCell.swift
//  abc
//
//  Created by PhuocNguyen on 10/24/19.
//  Copyright © 2019 PhuocNguyen. All rights reserved.
//

import UIKit

final class HomeGridCollectionViewCell: UICollectionViewCell, HomeCollectionCell {
    
    weak var delegate: HomeCollectionViewCellDelegate?
    var viewModel: HomeCollectionCellViewModel? {
        didSet {
            updateUI()
        }
    }
    
    @IBOutlet private weak var distanceLabel: UILabel!
    @IBOutlet private weak var pusblishedLabel: UILabel!
    @IBOutlet private weak var channelLabel: UILabel!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet weak var videoImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    private func setupUI() {
        backgroundColor = App.Color.backgroudColor
        layer.cornerRadius = 10
    }
    
    private func updateUI() {
        guard let viewModel = viewModel else { return }
        channelLabel.text = viewModel.channel
        titleLabel.text = viewModel.title
        pusblishedLabel.text = viewModel.published
    }
}
