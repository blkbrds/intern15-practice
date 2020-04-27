//
//  DetailTableViewCell.swift
//  BaiTapRealm
//
//  Created by ANH NGUYỄN on 1/30/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

protocol DetailTableViewCellDelagete: class {
    func getImage(cell: DetailTableViewCell, needPerform action: DetailTableViewCell.Action)
}

final class DetailTableViewCell: UITableViewCell {

    @IBOutlet private weak var watchersLabel: UILabel!
    @IBOutlet private weak var forksLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var avatarImageView: UIImageView!

    enum Action {
        case getImageCollection(indexPath: IndexPath?)
    }
    
    var indexPath: IndexPath?
    weak var delagate: DetailTableViewCellDelagete?
    var viewModel: DetailCellViewModel? {
        didSet {
            updateUI()
        }
    }

    private func updateUI() {
        if let viewModel = viewModel {
            watchersLabel.text = "\(viewModel.watcherCount)"
            forksLabel.text = "\(viewModel.forksCount)"
            descriptionLabel.text = viewModel.description
            nameLabel.text = viewModel.name
            if let image = viewModel.avatar {
                avatarImageView.image = image
            } else {
                avatarImageView.image = nil
                delagate?.getImage(cell: self, needPerform: Action.getImageCollection(indexPath: indexPath))
            }
        }
    }
}
