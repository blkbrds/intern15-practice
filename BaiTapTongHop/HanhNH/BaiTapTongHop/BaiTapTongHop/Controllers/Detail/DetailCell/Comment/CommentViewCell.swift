//
//  CommentViewCell.swift
//  BaiTapTongHop
//
//  Created by ANH NGUYỄN on 1/8/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

final class CommentViewCell: UITableViewCell {
    
    @IBOutlet private weak  var imgaeDetailView: UIImageView!
    @IBOutlet private weak var statusLabel: UILabel!
    @IBOutlet private weak var nameImageLabel: UILabel!
    @IBOutlet private weak var daysAgoLabel: UILabel!
    
    var viewModel: CommentViewModel? {
        didSet {
            updateDetail()
        }
    }
    
    func updateDetail() {
        guard let viewModel = viewModel else { return }
        nameImageLabel.text = viewModel.name
        statusLabel.text = viewModel.status
        imgaeDetailView.image = viewModel.image
        daysAgoLabel.text = "\(viewModel.day)"
    }
}
