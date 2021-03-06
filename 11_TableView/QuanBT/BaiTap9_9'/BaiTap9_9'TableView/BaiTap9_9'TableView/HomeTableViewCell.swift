//
//  HomeTableViewCell.swift
//  BaiTap9_9'TableView
//
//  Created by Sếp Quân on 4/3/20.
//  Copyright © 2020 QuanBT. All rights reserved.
//

import UIKit

protocol HomeTableViewCellDelegate: class {
    func tapMe(_ homeTableViewCell: HomeTableViewCell)
}

final class HomeTableViewCell: UITableViewCell {
    // MARK: - IBOutlet
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    
    // MARK: - Properties
    weak var detegale: HomeTableViewCellDelegate?
    
    var viewModel = HomeCellModel() {
        didSet {
            updateView()
        }
    }
    
    // MARK: - Override
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - IBAction
    @IBAction func tapMeTouchUpInside(_ sender: Any) {
        detegale?.tapMe(self)
    }
    
    // MARK: - updateView
    private func updateView() {
        let user = viewModel.user
        nameLabel.text = user.nameUser
        avatarImageView.image = UIImage(named: user.imageUser)
        subTitleLabel.text = user.subTitle
    }
}
