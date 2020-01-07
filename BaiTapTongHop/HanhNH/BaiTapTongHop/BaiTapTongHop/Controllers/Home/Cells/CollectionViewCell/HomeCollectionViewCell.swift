//
//  HomeCollectionViewCell.swift
//  BaiTapTongHop
//
//  Created by ANH NGUYỄN on 1/6/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

protocol HomeCollectionViewCellDelegate : class {
    func cell(cell: HomeCollectionViewCell, needPerform action: HomeCollectionViewCell.Action)
}

final class HomeCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak private var valueLabel: UILabel!
    @IBOutlet weak private var distanceLabel: UILabel!
    @IBOutlet weak private var addressLabel: UILabel!
    @IBOutlet weak private var nameAddressLabel: UILabel!
    @IBOutlet weak private var addressImageView: UIImageView!
    
    enum Action {
        case getImageCollection(indexPath: IndexPath?)
    }
    
    weak var delegateCollection: HomeCollectionViewCellDelegate?
    var indexPath: IndexPath?
    var viewModel: HomeCellTableViewModel? {
        didSet {
            updateCollectionView()
        }
    }

    private func updateCollectionView() {
        if let viewModel = viewModel {
            nameAddressLabel.text = viewModel.name
            valueLabel.text = "\(viewModel.numberOfForks)"
            distanceLabel.text = "\(viewModel.numberOfWatchers)"
            addressLabel.text = viewModel.description
            if let image = viewModel.avatarImage {
                addressImageView.image = image
            } else {
                addressImageView.image = nil
                delegateCollection?.cell(cell: self, needPerform: Action.getImageCollection(indexPath: indexPath))
            }
        } else {
            viewModel = nil
        }
    }
}

