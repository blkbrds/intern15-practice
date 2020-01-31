//
//  DetailTableViewCell.swift
//  BaiTapRealm
//
//  Created by ANH NGUYỄN on 1/30/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

class DetailTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var watchersLabel: UILabel!
    @IBOutlet private weak var forksLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var avatarImageView: UIImageView!
    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//    }
    var viewModel: DetailCellViewModel? {
        didSet {
            updateComment()
        }
    }
    
    private func updateComment() {
        guard let viewModel = viewModel else { return }
        watchersLabel.text = "\(viewModel.watcherCount)"
        forksLabel.text = "\(viewModel.forksCount)"
        descriptionLabel.text = viewModel.description
        nameLabel.text = viewModel.name
        avatarImageView.image = viewModel.avatar
    }
}
