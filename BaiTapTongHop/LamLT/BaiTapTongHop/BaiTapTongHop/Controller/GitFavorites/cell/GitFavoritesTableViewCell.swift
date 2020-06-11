//
//  GitFavoritesTableViewCell.swift
//  BaiTapTongHop
//
//  Created by PCI0002 on 6/11/20.
//  Copyright © 2020 LeThanhLam. All rights reserved.
//

import UIKit

final class GitFavoritesTableViewCell: UITableViewCell {

    //MARK: Properties
    @IBOutlet weak private var typeLabel: UILabel!
    @IBOutlet weak private var loginLabel: UILabel!
    @IBOutlet weak private var urlLabel: UILabel!
    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    var viewModel: GitFavoritesCellModel? {
        didSet {
            updateView()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    private func updateView() {
        typeLabel.text = viewModel?.type
        loginLabel.text = viewModel?.login
        urlLabel.text = viewModel?.url
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
