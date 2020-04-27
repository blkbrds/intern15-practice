//
//  FavoriteCell.swift
//  BaiTapRealm
//
//  Created by ANH NGUYỄN on 2/3/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

protocol FavoriteCellDelegate: class {
    func getImage(cell: FavoriteCell, needPerform action: FavoriteCell.Action)
}

final class FavoriteCell: UITableViewCell {
    
    @IBOutlet private weak var watchersLabel: UILabel!
    @IBOutlet private weak var forksLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var avatarImageView: UIImageView!
    
    enum Action {
        case getImageCollection(indexPath: IndexPath?)
    }
    var indexPath: IndexPath?
    weak var delegate: FavoriteCellDelegate?
    var viewModel: FavoriteCellViewModel? {
        didSet {
            updateUI()
        }
    }

    private func updateUI() {
       if let viewModel = viewModel {
            nameLabel.text = viewModel.name
        watchersLabel.text = "\(viewModel.watcherCount)"
        forksLabel.text = "\(viewModel.forksCount)"
        descriptionLabel.text = viewModel.description
        if let image = viewModel.avatar {
                avatarImageView.image = image
            } else {
                avatarImageView.image = nil
            delegate?.getImage(cell: self, needPerform: Action.getImageCollection(indexPath: indexPath))
            }
        }
    }
}
