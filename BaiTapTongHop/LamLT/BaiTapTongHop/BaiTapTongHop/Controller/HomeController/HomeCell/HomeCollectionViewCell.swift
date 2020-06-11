//
//  HomeCollectionViewCell.swift
//  BaiTapTongHop
//
//  Created by PCI0002 on 6/11/20.
//  Copyright © 2020 LeThanhLam. All rights reserved.
//

import UIKit

//MARK: Protocol
protocol HomeCollectionCellDelegate: class {
    func downloadImageForCell(indexPath: IndexPath)
}

final class HomeCollectionViewCell: UICollectionViewCell {
    
    //MARK: Properties
    @IBOutlet weak private var nameLabel: UILabel!
    @IBOutlet weak private var loginLabel: UILabel!
    @IBOutlet weak private var typeLabel: UILabel!
    @IBOutlet weak private var thumbnails: UIImageView!
    
    weak var delegate: HomeCollectionCellDelegate?

    var indexPath: IndexPath?
    
    
    var viewModel: HomeCellModel? {
        didSet {
            updateView()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    //MARK: Private Function
    private func updateView() {
        loginLabel.text = viewModel?.login
        nameLabel.text = viewModel?.name
        typeLabel.text = viewModel?.type
        if viewModel?.thumbnailImage == nil {
            if let delegate = delegate {
                delegate.downloadImageForCell(indexPath: indexPath!)
            }
        } else {
            thumbnails.image = viewModel?.thumbnailImage
        }
    }
}

