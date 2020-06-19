//
//  HomeCell.swift
//  BaiTap1API
//
//  Created by PCI0012 on 6/16/20.
//  Copyright © 2020 PCI0012. All rights reserved.
//

import UIKit

protocol HomeCellDelegate {
    func homeCell(cell: HomeCell, indexPath: IndexPath)
}

class HomeCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    
    var viewModel: HomeCellViewModel? {
        didSet {
            updateView()
        }
    }
    var indexPath: IndexPath?
    var delegate: HomeCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupUI() {
        avatarImageView.layer.cornerRadius = 10
    }
    
    private func updateView() {
        guard let viewModel = viewModel else {
            return
        }
        nameLabel.text = viewModel.entry.labelName
        priceLabel.text = viewModel.entry.labelPrice
        artistLabel.text = viewModel.entry.labelArtist
        
        if viewModel.entry.thumbnailImage == nil {
            if let delegate = delegate {
                if let indexPath = indexPath {
                    delegate.homeCell(cell: self, indexPath: indexPath)
                }
            }
        } else {
            avatarImageView.image = viewModel.entry.thumbnailImage
        }
    }
}
