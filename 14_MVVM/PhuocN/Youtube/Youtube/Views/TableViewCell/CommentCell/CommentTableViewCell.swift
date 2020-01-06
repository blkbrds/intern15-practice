//
//  CommentTableViewCell.swift
//  abc
//
//  Created by PhuocNguyen on 11/5/19.
//  Copyright © 2019 PhuocNguyen. All rights reserved.
//

import UIKit

final class CommentTableViewCell: UITableViewCell {
    
    @IBOutlet weak var contentCommentLabel: UILabel!
    @IBOutlet weak var nameAuthLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        selectionStyle = .none
        avatarImageView.layer.cornerRadius = avatarImageView.frame.height / 2
    }
}
