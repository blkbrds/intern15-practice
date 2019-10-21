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

class ContactTableViewCell: UITableViewCell {
    
    weak var delegate: ContactTableViewCellDelegate?
    var contact: Contact?
    
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var contactImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setupUI() {
        phoneNumberLabel.text = contact?.phoneNumber
        nameLabel.text = contact?.name
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupUI()
    }
    
    @IBAction func handleButtonTouchUpInSide(_ sender: Any) {
        delegate?.doSomeThing(self)
    }
}
