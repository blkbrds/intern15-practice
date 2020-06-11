//
//  OwnerHeader.swift
//  BaiTapTongHop
//
//  Created by PCI0002 on 6/11/20.
//  Copyright © 2020 LeThanhLam. All rights reserved.
//

import UIKit

class OwnerHeader: UITableViewHeaderFooterView {

    //MARK: Properties
    @IBOutlet weak private var loginLabel: UILabel!
    @IBOutlet weak private var headerImageView: UIImageView!

    var viewModel: OwnerHeaderModel? {
        didSet {
            updateView()
        }
    }
    
    //MARK: Public Function
    func updateView() {
        if let viewmodel = viewModel {
            loginLabel.text = "     \(viewmodel.login)"
            headerImageView.image = viewmodel.imageHeader
        }
    }
    
    override func awakeFromNib() {
        guard let headerImageView = headerImageView else {
            return
        }
        headerImageView.layer.borderWidth = 1.0
        headerImageView.layer.masksToBounds = false
        headerImageView.layer.cornerRadius = headerImageView.frame.size.height / 2
        headerImageView.clipsToBounds = true
        contentView.backgroundColor = .lightGray
    }
}
