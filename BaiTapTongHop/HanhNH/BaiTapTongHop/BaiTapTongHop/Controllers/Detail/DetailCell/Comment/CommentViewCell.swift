//
//  CommentViewCell.swift
//  BaiTapTongHop
//
//  Created by ANH NGUYỄN on 1/8/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

final class CommentViewCell: UITableViewCell {

    @IBOutlet private weak var imageComment: UIImageView!
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
        imageComment.layer.borderWidth = 1.0
        imageComment.layer.masksToBounds = false
        imageComment.layer.borderColor = UIColor.white.cgColor
        imageComment.layer.cornerRadius = 65
        imageComment.clipsToBounds = true
    }

    func updateDetail() {
        guard let viewModel = viewModel else { return }
        nameImageLabel.text = viewModel.userName
        statusLabel.text = viewModel.contentComment
        imageComment.image = UIImage(named: viewModel.avatar)
        daysAgoLabel.text = viewModel.created
    }
}
