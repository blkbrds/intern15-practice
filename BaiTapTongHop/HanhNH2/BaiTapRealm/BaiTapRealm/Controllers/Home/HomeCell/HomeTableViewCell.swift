//
//  HomeTableViewCell.swift
//  BaiTapRealm
//
//  Created by ANH NGUYỄN on 1/22/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

protocol HomeTableViewCellDelagete: class {
    func getImage(cell: HomeTableViewCell, needPerform action: HomeTableViewCell.Action)
}

final class HomeTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var watchersLabel: UILabel!
    @IBOutlet private weak var forksLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var avatarImageView: UIImageView!

    enum Action {
        case getImageCollection(indexPath: IndexPath?)
    }
    weak var delagate: HomeTableViewCellDelagete?
    var indexPath: IndexPath?
    var viewModel: HomeCellTableViewModel? {
        didSet {
            updateTabViewCell()
        }
    }

    private func updateTabViewCell() {
        if let viewModel = viewModel {
            nameLabel.text = viewModel.name
            watchersLabel.text = "\(viewModel.numberOfWatchers)"
            forksLabel.text = "\(viewModel.numberOfForks)"
            descriptionLabel.text = viewModel.descriptionName
            if let image = viewModel.avatarImage {
                avatarImageView.image = image
            } else {
                avatarImageView.image = nil
                delagate?.getImage(cell: self, needPerform: Action.getImageCollection(indexPath: indexPath))
            }
        }
    }
}
