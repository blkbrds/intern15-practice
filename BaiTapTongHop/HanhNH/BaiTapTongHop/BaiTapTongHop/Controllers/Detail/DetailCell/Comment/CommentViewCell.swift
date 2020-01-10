//
//  CommentViewCell.swift
//  BaiTapTongHop
//
//  Created by ANH NGUYỄN on 1/8/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

final class CommentViewCell: UITableViewCell {

    @IBOutlet private weak var avatarImageView: UIImageView!
    @IBOutlet private weak var statusLabel: UILabel!
    @IBOutlet private weak var nameImageLabel: UILabel!
    @IBOutlet private weak var daysAgoLabel: UILabel!

    var viewModel: CommentViewModel? {
        didSet {
            updateDetail()
        }
    }

    override func awakeFromNib() {
        // xu ly
        super.awakeFromNib()
        avatarImageView.layer.borderWidth = 1.0
        avatarImageView.layer.masksToBounds = false
        avatarImageView.layer.borderColor = UIColor.white.cgColor
        avatarImageView.layer.cornerRadius = 65
        avatarImageView.clipsToBounds = true
    }

    func updateDetail() {
        guard let viewModel = viewModel else { return }
        nameImageLabel.text = viewModel.userName
        statusLabel.text = viewModel.contentComment
        avatarImageView.image = UIImage(named: viewModel.avatar)
        daysAgoLabel.text = viewModel.created
    }
}
