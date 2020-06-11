//
//  OwnerHeaderCell.swift
//  API_MVVM_2
//
//  Created by PCI0002 on 6/4/20.
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
        headerImageView.layer.borderWidth = 1.0
        headerImageView.layer.masksToBounds = false
        headerImageView.layer.cornerRadius = headerImageView.frame.size.height / 2
        headerImageView.clipsToBounds = true
        contentView.backgroundColor = .lightGray
    }

}
