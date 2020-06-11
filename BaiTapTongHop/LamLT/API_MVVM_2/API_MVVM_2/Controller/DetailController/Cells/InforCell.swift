//
//  InforCell.swift
//  API_MVVM_2
//
//  Created by PCI0002 on 6/2/20.
//  Copyright © 2020 LeThanhLam. All rights reserved.
//

import UIKit

final class InforCell: UITableViewCell {

    //MARK: Properies
    @IBOutlet weak private var inforNameLabel: UILabel!
    @IBOutlet weak private var inforValueLabel: UILabel!
    
    var viewmodel: InforCellViewModel? {
        didSet {
            updateView()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    //MARK: Private Function
    private func updateView() {
        inforNameLabel.text = viewmodel?.name
        inforValueLabel.text = viewmodel?.value
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
