//
//  FileCell.swift
//  BaiTapTongHop
//
//  Created by PCI0002 on 6/11/20.
//  Copyright © 2020 LeThanhLam. All rights reserved.
//

import UIKit

final class FileCell: UITableViewCell {

    //MARK: Properties
    @IBOutlet weak private var valueLabel: UILabel!
    @IBOutlet weak private var nameLabel: UILabel!
    var viewmodel: FileGitModel? {
        didSet {
            updateView()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    //MARK: Public Function
    func updateView() {
        nameLabel.text = viewmodel!.name + " : "
        valueLabel.text = viewmodel?.value
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}
