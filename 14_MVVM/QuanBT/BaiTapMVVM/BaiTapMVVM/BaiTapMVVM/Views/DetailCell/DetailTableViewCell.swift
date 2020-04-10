//
//  DetailTableViewCell.swift
//  BaiTapMVVM
//
//  Created by Sếp Quân on 4/10/20.
//  Copyright © 2020 QuanBT. All rights reserved.
//

import UIKit

final class DetailTableViewCell: UITableViewCell {
    // MARK: - IBOutlet
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var commentLable: UILabel!
    @IBOutlet weak var timeAgoLabel: UILabel!
    
    // MARK: - Properties
    var viewModel = DetailCellModel() {
        didSet {
            updateView()
        }
    }
    
    // MARK: - Override
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        self.selectionStyle = .none
    }
    
    // MARK: - UpdateView
    private func updateView() {
        let dataDetail = viewModel.dataDetail
        avatarImageView.image = UIImage(named: dataDetail.image)
        nameLabel.text = dataDetail.name
        commentLable.text = dataDetail.comment
        timeAgoLabel.text = dataDetail.time
    }
}
