//
//  FavoritesCell.swift
//  BaiTapTongHop
//
//  Created by PCI0002 on 6/11/20.
//  Copyright © 2020 LeThanhLam. All rights reserved.
//


import UIKit

final class FavoritesCell: UITableViewCell {
    
    //MARK: Properties
    @IBOutlet weak private var typeLabel: UILabel!
    @IBOutlet weak private var loginLabel: UILabel!
    @IBOutlet weak private var nameLabel: UILabel!
    @IBOutlet weak var favoriteImageView: UIImageView!

    var viewModel: FavoritesCellViewModel? {
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
        typeLabel.text = viewModel?.type
        nameLabel.text = viewModel?.name
        loginLabel.text = viewModel?.loign
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
