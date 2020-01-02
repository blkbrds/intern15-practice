//
//  HomeTableViewCell.swift
//  Bai_Tap_14
//
//  Created by ANH NGUYỄN on 12/6/19.
//  Copyright © 2019 asiantech. All rights reserved.
//

import UIKit

protocol HomeTableViewCellDelagete: class {
    func getImage(cell: HomeTableViewCell, indexPath: IndexPath?)
}

final class HomeTableViewCell: UITableViewCell {

    @IBOutlet private weak var watchersLabel: UILabel!
    @IBOutlet private weak var forksLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    
    weak var delagete: HomeTableViewCellDelagete?
    var indexPath: IndexPath?
    var viewModelCell: HomeCellTabelViewModel? {
        didSet {
            updateTabViewCell()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    private func updateTabViewCell() {
        if let viewModelCell = viewModelCell {
            nameLabel.text = viewModelCell.name
            watchersLabel.text = "\(viewModelCell.watchers)"
            forksLabel.text = "\(viewModelCell.forks)"
            descriptionLabel.text = viewModelCell.description
            if let image = viewModelCell.avatar {
                avatarImageView.image = image
            } else {
                avatarImageView.image = nil
                delagete?.getImage(cell: self, indexPath: indexPath)
            }
        } else {
            print("nil")
        }
    }
}
