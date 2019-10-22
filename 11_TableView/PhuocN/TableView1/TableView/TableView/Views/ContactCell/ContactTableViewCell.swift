//
//  ContactTableViewCell.swift
//  TableView
//
//  Created by PhuocNguyen on 10/18/19.
//  Copyright © 2019 PhuocNguyen. All rights reserved.
//

import UIKit

protocol ContactTableViewCellDelegate: class {
    func doSomeThing(_ contactTablecell: ContactTableViewCell)
}

final class ContactTableViewCell: UITableViewCell {
    
    weak var delegate: ContactTableViewCellDelegate?
    var contact: Contact?
    
    @IBOutlet private weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet private weak var contactImageView: UIImageView!
    
    func setupUI() {
        phoneNumberLabel.text = contact?.phoneNumber
        nameLabel.text = contact?.name
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupUI()
    }
    
    @IBAction func handleButtonTouchUpInside(_ sender: Any) {
        delegate?.doSomeThing(self)
    }
}
