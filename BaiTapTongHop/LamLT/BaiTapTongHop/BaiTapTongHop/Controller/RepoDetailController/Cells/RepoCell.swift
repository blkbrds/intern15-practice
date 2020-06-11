//
//  RepoCell.swift
//  BaiTapTongHop
//
//  Created by PCI0002 on 6/11/20.
//  Copyright © 2020 LeThanhLam. All rights reserved.
//

import UIKit

//MARK: Protocol
protocol RepoCellDelegate: class {
    func downloadImageDetail(indexPath: IndexPath)
}

final class RepoCell: UITableViewCell {

    //MARK: Properties
    @IBOutlet weak private var nameLabel: UILabel!
    @IBOutlet weak private var typeLabel: UILabel!
    @IBOutlet weak private var loginLabel: UILabel!
    @IBOutlet weak private var repoAvatarImage: UIImageView!

    weak var delegate: RepoCellDelegate?

    var indexPath: IndexPath?

    var viewmodel: HomeCellModel? {
        didSet {
            updateView()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    //MARK: Private Function
    private func updateView() {
        loginLabel.text = viewmodel?.login
        nameLabel.text = viewmodel?.name
        typeLabel.text = viewmodel?.type
        if viewmodel?.thumbnailImage == nil {
            if let delegate = delegate {
                delegate.downloadImageDetail(indexPath: indexPath!)
            }
        } else {
            repoAvatarImage.image = viewmodel?.thumbnailImage
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

