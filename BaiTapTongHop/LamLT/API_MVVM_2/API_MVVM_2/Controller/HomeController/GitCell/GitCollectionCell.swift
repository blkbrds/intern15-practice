//
//  GitCollectionCell.swift
//  API_MVVM_2
//
//  Created by PCI0002 on 6/4/20.
//  Copyright © 2020 LeThanhLam. All rights reserved.
//

import UIKit

//MARK: Protocol
protocol GitCollectionCellDelegate: class {
    func downloadImageForGitCell(indexPath: IndexPath)
}

final class GitCollectionCell: UICollectionViewCell {

    // MARK: Properties
    @IBOutlet weak private var thumbnailGitImageView: UIImageView!
    @IBOutlet weak private var typeLabel: UILabel!
    @IBOutlet weak private var loginLabel: UILabel!
    @IBOutlet weak private var urlLabel: UILabel!

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
        thumbnailGitImageView.layer.borderWidth = 1.0
        thumbnailGitImageView.layer.masksToBounds = false
        thumbnailGitImageView.layer.cornerRadius = thumbnailGitImageView.frame.size.height / 2
        thumbnailGitImageView.clipsToBounds = true
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
            thumbnailGitImageView.image = viewmodel?.thumbnail
        }
    }
}
