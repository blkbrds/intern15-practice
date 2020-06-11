//
//  GitCell.swift
//  BaiTapTongHop
//
//  Created by PCI0002 on 6/11/20.
//  Copyright © 2020 LeThanhLam. All rights reserved.
//

import UIKit

//MARK: Protocol
protocol GitCellDelegate: class {
    func downloadImageForGit(indexPath: IndexPath)
}

final class GitCell: UITableViewCell {

    // MARK: Properties
    @IBOutlet weak private var loginLabel: UILabel!
    @IBOutlet weak private var urlLabel: UILabel!
    @IBOutlet weak private var typeLabel: UILabel!
    @IBOutlet weak private var thumbnails: UIImageView!

    weak var delegate: GitCellDelegate?

    var indexPath: IndexPath?

    var viewmodel: GitModel? {
        didSet {
            updateView()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        thumbnails.layer.borderWidth = 1.0
        thumbnails.layer.masksToBounds = false
        thumbnails.layer.cornerRadius = thumbnails.frame.size.height / 2
        thumbnails.clipsToBounds = true
    }
    
    //MARK: Private Function
    private func updateView() {
        loginLabel.text = viewmodel?.login
        urlLabel.text = viewmodel?.url
        typeLabel.text = viewmodel?.typeOwner
        if viewmodel?.thumbnail == nil {
            if let delegate = delegate {
                delegate.downloadImageForGit(indexPath: indexPath!)
            }
        } else {
            thumbnails.image = viewmodel?.thumbnail
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
