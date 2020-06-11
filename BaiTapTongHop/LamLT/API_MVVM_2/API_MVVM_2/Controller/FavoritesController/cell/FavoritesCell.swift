//
//  FavoritesCell.swift
//  API_MVVM_2
//
//  Created by PCI0002 on 6/8/20.
//  Copyright © 2020 LeThanhLam. All rights reserved.
//

import UIKit

class FavoritesCell: UITableViewCell {
    
    //MARK: Properties
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
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

    private func updateView() {
        typeLabel.text = viewModel?.type
        nameLabel.text = viewModel?.name
        loginLabel.text = viewModel?.loign
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
